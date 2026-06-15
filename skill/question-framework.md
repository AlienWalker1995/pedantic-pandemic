# Question Framework

Reusable checklist of pedantic questions by task type. Use the relevant section based on the task classification.

## New Feature

- [ ] What exact outcome should be true when this feature is done?
- [ ] What is explicitly out of scope for this feature?
- [ ] Which constraints are hard constraints versus preferences?
- [ ] What are the input/output shapes for this feature?
- [ ] What external systems does this feature interact with?
- [ ] What are the failure modes?
- [ ] How will we know the feature works correctly?
- [ ] What is the rollback strategy if the feature causes issues?
- [ ] Are there performance constraints (latency, throughput, memory)?
- [ ] What is the deployment order? Does this require a migration?

## Bug Fix

- [ ] What is the exact expected behavior vs. actual behavior?
- [ ] What are the reproduction steps? Are they deterministic?
- [ ] What version introduced this bug? Was there a regression test at the time?
- [ ] What is the scope of the bug? Does it affect all users or a subset?
- [ ] What is the impact of the bug? (data loss, security, UX, performance)
- [ ] Are there workarounds?
- [ ] What is the fix boundary? Will this fix affect other areas?
- [ ] What tests should be added to prevent regression?
- [ ] Is this a symptom of a deeper issue?

## Refactor

- [ ] What is the goal of the refactor? (readability, performance, testability, architecture)
- [ ] What should remain unchanged? (API contract, behavior, performance characteristics)
- [ ] What is the scope of the refactor? (single module, service, system)
- [ ] Are there backward compatibility constraints?
- [ ] What is the test coverage before the refactor?
- [ ] What is the risk of introducing new bugs during the refactor?
- [ ] Can the refactor be done incrementally or does it need to be atomic?
- [ ] What is the rollback strategy?
- [ ] Are there performance benchmarks to compare against?

## API Design

- [ ] What is the exact contract? (request/response shapes, status codes, error formats)
- [ ] What are the versioning constraints? (backward compatible, breaking changes)
- [ ] What are the authentication/authorization requirements?
- [ ] What are the rate limiting constraints?
- [ ] What are the error handling requirements? (retry, timeout, circuit breaker)
- [ ] What are the data consistency requirements? (strong, eventual, causal)
- [ ] What are the security requirements? (encryption, signing, validation)
- [ ] What are the observability requirements? (logging, metrics, tracing)
- [ ] What are the documentation requirements? (OpenAPI, examples, SDKs)

## Architecture Decision

- [ ] What problem is this architecture solving?
- [ ] What are the non-functional requirements? (scalability, availability, consistency, latency)
- [ ] What are the trade-offs of each option?
- [ ] What is the cost of reversal? (can we undo this decision?)
- [ ] What are the operational implications? (monitoring, deployment, scaling)
- [ ] What are the team skill requirements? (do we have the expertise?)
- [ ] What are the vendor lock-in implications?
- [ ] What are the security implications?
- [ ] What are the data migration requirements?

## Migration

- [ ] What is the source and target state?
- [ ] What is the migration strategy? (big bang, parallel, strangler fig)
- [ ] What is the rollback strategy?
- [ ] What is the downtime budget?
- [ ] What data needs to be migrated? (schema, records, relationships)
- [ ] What are the data consistency requirements during migration?
- [ ] What is the migration order? (dependencies, priorities)
- [ ] What are the validation steps? (how do we know migration succeeded?)
- [ ] What is the monitoring strategy during migration?

## Security Review

- [ ] What is the attack surface?
- [ ] What are the authentication/authorization mechanisms?
- [ ] What data is sensitive? (PII, credentials, tokens)
- [ ] What are the encryption requirements? (at rest, in transit)
- [ ] What are the input validation requirements?
- [ ] What are the output encoding requirements?
- [ ] What are the dependency security requirements?
- [ ] What are the logging/auditing requirements?
- [ ] What are the compliance requirements? (GDPR, HIPAA, SOC2)

## Prompt Design

- [ ] What is the exact input format? (text, structured, multimodal)
- [ ] What is the expected output format? (text, JSON, structured)
- [ ] What are the constraints on the output? (length, format, vocabulary)
- [ ] What is the context window budget?
- [ ] What are the temperature/top_p settings?
- [ ] What are the failure modes? (hallucination, truncation, format errors)
- [ ] What are the evaluation criteria? (accuracy, relevance, completeness)
- [ ] What are the cost constraints? (tokens per request, requests per minute)
- [ ] What are the latency requirements? (real-time, batch)
