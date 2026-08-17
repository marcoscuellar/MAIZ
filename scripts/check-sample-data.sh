#!/usr/bin/env bash
# Guards hard rule #2: no real client or person data in sample content.
# Run from the repo root:  ./scripts/check-sample-data.sh
# Exits non-zero if anything on the banned list appears, so it can gate a deploy.

set -uo pipefail
cd "$(dirname "$0")/.."

# Names that must never appear again, plus artifacts of real data
BANNED=(
  Mediaocean Satish Mandalika Hallmark Crissi Matthews Procom Northwind
  Spyglass Prisma "24 Seven" "Agency Client" "1399407300"
)

# Approved fictional roster — anything else that looks like sample identity
# should be checked by a human before shipping.
APPROVED=(
  "Brightpath Health" "Halcyon Devices" "Cobalt Platforms" "Northgate Freight"
  "Dana Rivera" "Marcus Vale" "Priya Anand" "Leo Fontaine" "Nadia Cole"
  "Omar Reyes" "Sofia Marin" "Grace Kim"
)

TARGETS=(index.html parked builds)
fail=0

echo "Checking sample data in: ${TARGETS[*]}"
echo

for name in "${BANNED[@]}"; do
  if hits=$(grep -rIni -- "$name" "${TARGETS[@]}" 2>/dev/null); then
    echo "BANNED TERM FOUND: '$name'"
    echo "$hits" | sed 's/^/    /'
    fail=1
  fi
done

# Sample email addresses must use a reserved TLD that can never resolve
if bad=$(grep -rIoEh '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' "${TARGETS[@]}" 2>/dev/null \
         | grep -vE '\.(example|invalid|test|localhost)$' | sort -u); then
  if [ -n "$bad" ]; then
    echo "EMAIL NOT USING A RESERVED TLD (use .example):"
    echo "$bad" | sed 's/^/    /'
    fail=1
  fi
fi

if [ "$fail" -eq 0 ]; then
  echo "PASS — no banned terms; all sample emails use reserved TLDs."
  echo
  echo "Approved roster in use:"
  for n in "${APPROVED[@]}"; do
    c=$(grep -rIoh -- "$n" index.html 2>/dev/null | wc -l | tr -d ' ')
    [ "$c" != "0" ] && printf '    %-20s %s\n' "$n" "$c"
  done
  exit 0
fi

echo
echo "FAIL — fix the above before shipping. See hard rule #2 in README.md."
exit 1
