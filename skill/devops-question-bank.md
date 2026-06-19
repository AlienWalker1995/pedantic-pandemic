# DevOps / SRE Question Bank

Exhaustive reference for the `pedantic-devops` role. Adapt, don't recite; every question
must pass the five-test bar in `interrogation-protocol.md`. Organizing question: **"How
does this get delivered and operated reliably — and what happens when it breaks at 2 a.m.?"**

## Build & CI
- Pipeline stages (lint/test/build/scan/package); merge gates; required checks.
- Reproducible builds; caching; artifact versioning/immutability; SBOM; flaky-test policy.
- Pipeline runtime + cost.

## Release & deployment (CD)
- Strategy: rolling / blue-green / canary / feature-flag; promote/abort criteria.
- Rollback: one-command revert? migration reversibility? forward-fix vs roll-back policy.
- Cadence; change-freeze; approvals/audit trail; zero-downtime requirement.

## Configuration & secrets (12-factor)
- Config via env; per-env parity; no config baked in images.
- Secrets: storage (vault/secrets-manager/sealed), injection, rotation, least-privilege, never in logs/repo.
- Feature flags lifecycle (and cleanup of stale flags).

## Infrastructure & IaC
- Everything as code (Terraform/Pulumi/Helm/compose); state mgmt; drift detection; plan→apply review.
- Runtime: containers/orchestration (K8s/Compose/serverless); base-image policy; resource requests/limits.
- Environments: count, provisioning, teardown; ephemeral/preview envs.

## Scaling & capacity
- Stateless vs stateful; where state lives; sticky sessions.
- Horizontal vs vertical; autoscaling signals + limits; expected/peak load + headroom; load testing.
- Bottlenecks: DB connections, queues, rate limits, cold starts, downstream quotas.

## Reliability (SRE)
- SLIs/SLOs + error budget; definition of "down" for this feature.
- SPOFs; redundancy/HA; multi-AZ/region; graceful degradation.
- Dependency failure handling: timeouts, retries w/ backoff+jitter, circuit breakers, idempotency, bulkheads.
- Backups & DR: what's backed up, restore tested, RPO/RTO.

## Observability
- Logs (structured, correlation IDs, retention, PII scrubbing); metrics (RED/USE); traces (distributed).
- Health/readiness/liveness; alerting (symptom-based, actionable, owned) vs noise; dashboards.
- Runbooks; on-call; "how would I debug this in prod with no repro?"

## Security operations (DevSecOps)
- Least-privilege IAM; network segmentation; ingress/egress; TLS everywhere.
- Image + dependency scanning; supply-chain (signing, provenance, pinned deps); patch cadence.
- Audit logging; compliance scope (SOC2/GDPR/HIPAA); data residency; deploy-surface threat model.

## Data operations
- Migrations: forward/backward compatible? online/zero-downtime (expand-contract)? gated by deploy?
- Data growth/retention/archival; PII handling; backup encryption + restore drills.

## Cost & lifecycle
- Cost drivers; FinOps guardrails (budgets/alerts); right-sizing; idle cleanup.
- Ownership post-launch (who operates it); decommission/sunset plan.
