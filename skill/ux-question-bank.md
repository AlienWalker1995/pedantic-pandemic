# UX Question Bank

Exhaustive reference for the `pedantic-ux` role. Prompts to adapt, not a script — every
question asked must pass the five-test bar in `interrogation-protocol.md`. Organizing
question: **"How will the user actually experience this — including when it goes wrong?"**

## Users, jobs & mental models
- Who is the primary user; proficiency (first-timer / occasional / power); accessibility needs.
- The task in the user's own words; trigger; frequency; context (device, environment, urgency, interruptions).
- The mental model / prior tools they'll map this onto; vocabulary they use.
- What "success" feels like to *them*.

## Flows & task analysis
- Happy path step by step; number of steps/taps to the primary action.
- Where the user arrives from; where they go after; cross-screen continuity.
- Branches & decisions; optional vs required steps; can steps be removed/reordered/defaulted?
- Unhappy paths: cancel, back, timeout, conflict, validation failure, permission denial — recovery for each.
- Multi-session / resumable tasks; autosave; draft state.

## Information architecture & navigation
- Where it lives in the product; how users find it and return; deep-linkability.
- Labels/taxonomy in user language; grouping; progressive disclosure; defaults.
- Wayfinding: titles, breadcrumbs, active state, back behavior.

## Interaction & feedback (Nielsen heuristics)
- System status after every action (immediate, perceptible feedback).
- Affordances/signifiers: what's clickable/editable/draggable/selectable.
- Control & freedom: undo/redo, cancel, confirm destructive, no dead ends.
- Consistency with platform + product conventions; recognition over recall.
- Error prevention: constraints, smart defaults, confirmation, format guidance.
- Latency handling: optimistic UI, skeletons, debounce, double-submit guard.

## States (enumerate all)
- Empty (first-run vs cleared), loading, partial, success, error (per type), offline, permission-denied, zero-results, too-many-results, stale/refreshing, rate-limited, expired/session-timeout.
- For each: what's shown, what's actionable, how to recover.

## Content design & microcopy
- Exact CTA labels, headings, empty-state copy, and error messages (specific + actionable).
- Voice & tone; reading level; terminology consistency; jargon.
- i18n: text expansion, RTL, pluralization, locale formats (date/number/currency), translatable strings.

## Accessibility (WCAG 2.2 AA)
- Keyboard: full operability, logical order, visible focus, no traps; shortcuts.
- Screen reader: semantic structure, names/roles/values, live-region announcements.
- Color/contrast: ≥4.5:1 text, ≥3:1 UI/graphics; never color-only signals.
- Targets ≥24px (prefer ≥44px); spacing; pointer alternatives.
- Motion: respect reduced-motion; no auto-playing/seizure risk; pausable.
- Forms: labels, inline errors tied to fields, required/optional, error summary.

## Responsive & multi-device
- Breakpoints; what stacks/hides/reflows; mobile-first vs desktop-first.
- Touch vs pointer vs keyboard; no hover-only; safe areas/notches; orientation.
- Perceived performance on low-end devices / slow networks.

## Onboarding, trust & edge personas
- First-run comprehension without tooltip walls; empty-state as onboarding.
- Permission/consent timing (in-context, just-in-time); trust & privacy cues.
- Edge personas: low vision, motor/cognitive, non-native, power users (shortcuts/bulk).

## Measurement
- Behavioral signal of success (task success, time-on-task, drop-off, error rate, SUS) to hand to Product/analytics.
