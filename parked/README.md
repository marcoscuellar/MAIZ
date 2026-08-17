# Parked sections

Sections lifted off the landing page but **kept whole**. Nothing here was deleted from the project — it was moved out of `index.html` so the landing page could become a short product page, and preserved so it can come back or become its own page.

Everything here originated in **`builds/ollin-maiz-20260817-1211.html`**, the complete 14-section build. That file is the reference copy; git history holds it too (first commit on this branch).

## `pages/` — standalone and runnable

Open any of these directly in a browser. Each carries the full design system, its own section markup, and only the JavaScript that section needs. All four were render-verified: the carousel rotates, the accordion opens, the console types.

| File | What it is | Verified |
|---|---|---|
| `pages/engines.html` | The 8-engine 3D carousel (`#engines`) | 8 cards, 8 dots, rotation works |
| `pages/pathways.html` | The four pathway routes (`#pathways`) | 4 route blocks, 22 steps, accordion works |
| `pages/vamos-dark.html` | The original dark VAMOS replica (`#vamos`) | 6 intel rows, compose panel works |
| `pages/ai.html` | The ŌLLIN AI console demo (`#ai`) | 7 console lines, typing loop works |

**These are the seeds of the future Pathways and Engines pages.** To turn one into a real page: rename it, add the masthead and footer from `index.html`, and wire it into the nav.

## `sections/` — markup snippets

Static sections with no JavaScript of their own. Each file opens with a comment naming its original line range and its CSS/JS dependencies, so reinstating one is a paste plus whatever the comment lists.

| File | What it is |
|---|---|
| `sections/output.html` | The sample email (`#output`) |
| `sections/tracker.html` | Tracker stat grid + status table (`#tracker`) |
| `sections/rules.html` | Human control, three rule blocks (`#rules`) |
| `sections/receipts.html` | Verbatim tester quotes (`#receipts`) |

## Why each one came off

- **`#ai`** — a near-duplicate of the §02 Signal console demo. Two self-typing terminals on one page is one too many; Signal survived.
- **`#output`** — the sample email. The outreach half of the new VAMOS card does the same job live and interactively.
- **`#vamos`** — the dark replica, superseded by the light product card that is now the centerpiece.
- **`#engines`, `#pathways`, `#tracker`** — held back deliberately: *"bring out the pathways and the engines later."*
- **`#rules`, `#receipts`** — off the short page. **"Approval is not send" was relocated into the CTA**, where it does the most work. The other two preserved lines ("Evidence or not at all", "Missing beats fabricated") and all the receipt quotes live on here, unaltered.

## Two things to watch when reinstating

1. **Rule #5 text is verbatim.** The receipt quotes and their anonymized attributions, and the three rule lines, must not be reworded when a section comes back.
2. **Rail numbers are positional.** Each section's `.no` value (`11`, `05`, …) reflects where it *used* to sit. Renumber to match wherever you reinsert it.
