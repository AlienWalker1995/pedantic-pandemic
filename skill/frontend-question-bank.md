# Frontend Engineering Question Bank

Exhaustive reference for the `pedantic-frontend` role. Adapt, don't recite; every
question must pass the five-test bar in `interrogation-protocol.md`. Organizing
question: **"Why does this matter technically in the client — and what breaks at scale,
on slow devices, or in the unhappy path?"**

## Framework & rendering
- Existing app or greenfield; framework + version; match existing conventions.
- Rendering: CSR / SSR / SSG / ISR / streaming — driven by SEO, TTFB, freshness, personalization.
- Server vs client component boundary; hydration cost; islands/partial hydration.

## Component architecture
- Component breakdown; composition; reuse vs new; container/presentational.
- Design system / component library; design tokens; theming; dark mode.
- Prop contracts; controlled vs uncontrolled; avoid prop-drilling; slots/children.

## State management
- Local vs global vs URL vs server-state (cache) — keep them distinct.
- Tool choice; normalization; derived/memoized state; selectors.
- Optimistic updates; cache invalidation; cross-tab/realtime sync; consistency with backend.

## Data fetching & API contract
- Transport (REST/GraphQL/RPC); exact request/response shapes (drives backend asks).
- Per-request loading/error/empty; retries/backoff; cancellation; race conditions.
- Pagination/infinite scroll; caching/staleness; prefetch; avoid client N+1; websockets/SSE.

## Performance (Core Web Vitals)
- LCP: critical CSS, image optimization (srcset, modern formats, lazy, explicit dimensions → no CLS), preload key assets.
- INP/interactivity: minimize main-thread JS, code-split, lazy routes, defer non-critical.
- Bundle budget; tree-shaking; third-party cost; font loading (FOUT/FOIT); long-list virtualization.
- Low-end device + slow/flaky network behavior; measure with RUM + lab.

## Accessibility implementation
- Semantic HTML first; minimal correct ARIA; roles/names/values.
- Focus management: route changes, modal open/close (trap + restore), skip links.
- Live-region announcements; keyboard handlers for custom widgets; visible focus styles.

## Forms & validation
- Client+server validation parity; when validation fires; inline error UX.
- Accessible error association; submitting/disabled states; multi-step persistence; autofill; file upload.

## Responsive & styling
- CSS strategy (utility / CSS-in-JS / modules); breakpoints; container queries; tokens.
- Asset/image strategy; RTL; reduced-motion; print styles if needed.

## Browser/device support & i18n
- Support matrix (browsers/versions, mobile webviews); progressive enhancement vs graceful degradation; polyfills.
- i18n impl: message catalogs, formatting, text expansion, locale switch, lazy-loaded locales.

## Quality, security & observability
- Testing bar: unit, component, e2e, visual-regression, automated a11y.
- Error boundaries; client error/telemetry (RUM, source maps); feature flags/experiments.
- Security: XSS/sanitization, CSP, no secrets in bundle, safe token storage, dependency/supply-chain risk.
- Build/tooling: bundler, env/config, CI checks, preview deploys.

## Handoff
- The API/contract requirements the backend must satisfy (shapes, endpoints, errors, auth).
