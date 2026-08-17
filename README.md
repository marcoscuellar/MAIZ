# ŌLLIN : MAIZ — landing page

A self-contained landing page for **MAIZ**, the agentic sales-intelligence system under the **ŌLLIN** parent brand.

- **`index.html` is canonical.** Open it in a browser and it works.
- **No build step. No dependencies.** The only external request is the Google Fonts CDN (Archivo + IBM Plex Mono).
- All interactions are vanilla JS in two `<script>` blocks at the end of `<body>`. No frameworks.
- Deployed as a static site on Vercel — a root `index.html` needs zero config.

## Layout

| Path | What it is |
|---|---|
| `index.html` | The live page. Edit this. |
| `builds/` | Date-stamped snapshots (`ollin-maiz-YYYYMMDD-HHMM.html`). Never edited — these are the retrieval trail. |
| `parked/` | Sections lifted off the landing page but preserved whole, ready to become their own pages. Not referenced by `index.html`. |

`builds/ollin-maiz-20260817-1211.html` is the **complete original 14-section build** the current page was reduced from. If a section needs to come back, it's in there and in git history.

## The product story — do not dilute

- **ŌLLIN AI** — conversational front door / orchestrator
- **MAIZ** — the intelligence-to-execution system (8 engines)
- **Tracker** — connective tissue / shared record
- **VAMOS** — puts prepared actions in front of the human

The human reviews, approves, sends. Narrative arc:
`QUESTION → SIGNAL → EVIDENCE → DECISION → ACTION → RECORD → NEXT ACTION`

## HARD RULES — do not violate

These have been enforced repeatedly. If a spec document asks for something on this list, **flag it and confirm** rather than doing it.

1. **No letter-scramble animation. Ever.** It has been added twice from spec docs and rejected both times. (The *number*-scramble on the stat figures in §00 is different and is original, intended behavior — that one stays.)
2. **No real client or person names in sample data.**
   - Approved fictional set: Brightpath Health Systems, Halcyon Devices, Cobalt Platforms, Northgate Freight, Dana Rivera, Marcus Vale, Priya Anand, Leo Fontaine, Nadia Cole, Omar Reyes, Sofia Marin, Grace Kim.
   - Must **never** appear: Mediaocean, Satish Mandalika, Hallmark, Crissi Matthews, 24 Seven, Procom, Northwind.
   - This applies to req numbers, salary bands, and company names copied from real screenshots too.
3. **ŌLLIN always carries the macron (Ō)** in all visible text.
4. **No hype language.** Never "revolutionary", "game-changing", "effortless", "next level", or unverifiable absolutes like "the only".
5. **Preserve verbatim:** all stats and their citations (Salesforce State of Sales, Bullhorn GRID 2026), the receipt quotes and their anonymized attributions, the lines "Evidence or not at all", "Missing beats fabricated", "Approval is not send", and every "sample data / nothing sent" disclaimer.
6. **Ship a date-stamped copy into `builds/` on every delivery** so a specific version can always be retrieved.
7. **El Macron in 3D is fine small** (a badge or stamp on a card) but **not** as a large page-header showcase.
8. The verified stamp reads **VERIFIED** — not "VALIDATED".

## Design system — do not redesign

**Colors**

| Token | Value |
|---|---|
| `--black` | `#0B0C10` |
| `--surface` | `#14161F` |
| `--raised` | `#0E1016` |
| `--border` | `#222634` |
| `--em` (volt accent) | `#D4FF00` (rgb `212,255,0`) |
| `--on-em` | `#14180A` |
| `--ink` | `#F8FAFC` |
| `--slate` | `#94A3B8` |
| `--body` | `#C9D3DE` |
| `--dim` | `#77879A` |

The volt palette is applied via `<html data-accent="volt">`; the bare `:root` orange (`#FF4500`) is the alternate theme.

**Type** — Archivo (900, uppercase, tight tracking for all headlines) + IBM Plex Mono (labels, eyebrows, system voice). Hero `h1` is `clamp(52px,8.6vw,126px)` / line-height `.88` / tracking `-.055em`.

**Convention:** mono = the system talking, Archivo = humans talking.

**Logo** — "El Macron": a volt macron bar over a white ring (the Ō). Appears in the masthead (20px), the hero (34px, scroll-fades by ~420px), the footer (40px), and the favicon (inline SVG data URI).

**Signature device** — the volt highlight block (`.hl`) behind a key word, and volt periods ending headlines.

**Motion** — for "appear" animations, the Motion.dev hero-terminal feel: blur + fade + rise + slight scale, with staggered children. Reveals use IntersectionObserver with `rootMargin: '0px 0px -42% 0px'` so they play on arrival rather than on first peek. `prefers-reduced-motion` is honored throughout.

## Brand voice

Concise, confident, specific, human. Editorial black and volt. The system shows its work; restraint is the differentiator. Anti-lead-gen positioning: everyone else sells volume — MAIZ verifies, protects, and tracks the person.

## Known issues

- The Forrester / Tandem.ai statistic in §01 ("4.3 hours a week… $14,200 per employee, per year") is **not independently verified**. It is a public claim with a named source and should be confirmed before it stays in production.
- `.va-q:hover` references `--line-2`, a custom property that is never defined, so that hover is a no-op.
- The booking CTA destination is a placeholder constant pending the real scheduler URL.
