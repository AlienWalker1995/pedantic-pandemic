# Examples

## Example 1: Vague Feature Request

**Input:** "Add a search feature."

**Classification:** Partially specified

**Pedantic Questions:**
1. What exact outcome should be true when search is done? (e.g., "Users can find products by keyword")
2. What is the search scope? (e.g., "Search only product names" vs. "Search product names, descriptions, and tags")
3. What are the performance constraints? (e.g., "Results in under 200ms")
4. What is the input format? (e.g., "Free text query" vs. "Structured query with filters")
5. What is the output format? (e.g., "JSON array of products" vs. "Paginated HTML results")
6. Are there ranking/sorting requirements? (e.g., "Sort by relevance" vs. "Sort by price")
7. What happens with no results? (e.g., "Show 'No results' message" vs. "Suggest similar products")
8. Is full-text search needed or is simple string matching sufficient?

**Improved Task:** "Add keyword search to the product catalog. Search product names and descriptions. Return JSON array sorted by relevance. Results in under 200ms. Show 'No results' message when empty. Use PostgreSQL full-text search."

**Final Response Shape:**
```
1. Problem: Add keyword search to product catalog
2. Ambiguities: None remaining after clarification
3. Questions: None (all clarified)
4. Assumptions: None
5. Plan: Implement PostgreSQL full-text search with product name/description scope
6. Acceptance: Search returns results in <200ms, JSON format, sorted by relevance
7. Risks: Full-text search may need index rebuild on large datasets
```

## Example 2: Ambiguous Bug Report

**Input:** "The app crashes sometimes."

**Classification:** Dangerously ambiguous

**Pedantic Questions:**
1. What is the exact error? (stack trace, error message, exit code)
2. How often does it crash? (every time, 1 in 10, 1 in 100)
3. Under what conditions does it crash? (specific input, specific time, specific user)
4. What version is affected? Is it reproducible on other versions?
5. What is the impact? (data loss, user disruption, silent failure)
6. Are there logs available? Where are they stored?
7. What is the environment? (OS, browser, device, network)

**Improved Task:** "App crashes with NullPointerException in UserService.java:42 when loading user profile for users with no avatar. Affects 15% of users. Reproducible on iOS 17. Log: 'Cannot invoke method on null object'. Fix: Add null check before accessing avatar URL."

**Final Response Shape:**
```
1. Problem: NullPointerException when loading user profile for users without avatar
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [inferred] The crash is specific to iOS 17 (confidence: medium)
5. Plan: Add null check in UserService.java:42 before accessing avatar URL
6. Acceptance: No crash for users without avatar, 15% crash rate drops to 0%
7. Risks: May need to handle null avatar in UI layer too
```

## Example 3: Under-Specified Refactor

**Input:** "Refactor the auth module."

**Classification:** Partially specified

**Pedantic Questions:**
1. What is the goal of the refactor? (readability, performance, testability, architecture)
2. What should remain unchanged? (API contract, behavior, performance)
3. What is the scope? (single file, module, service)
4. What is the current test coverage?
5. Can the refactor be done incrementally or must it be atomic?
6. What is the rollback strategy?
7. Are there performance benchmarks to compare against?

**Improved Task:** "Refactor auth module to use dependency injection instead of global state. Goal: improve testability. API contract unchanged. Current test coverage: 45%. Can be done incrementally. Rollback: git revert. No performance benchmarks needed."

**Final Response Shape:**
```
1. Problem: Refactor auth module from global state to dependency injection
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [assumed] API contract must remain unchanged (confidence: high)
5. Plan: Step 1: Extract auth interface. Step 2: Replace global state with DI. Step 3: Update callers.
6. Acceptance: All existing tests pass, API contract unchanged, test coverage >= 45%
7. Risks: May break callers that depend on global state pattern
```

## Example 4: Architecture Review

**Input:** "Review the microservices architecture."

**Classification:** Partially specified

**Pedantic Questions:**
1. What is the scope of the review? (all services, specific service, inter-service communication)
2. What are the review criteria? (scalability, reliability, maintainability, cost)
3. What is the current architecture? (service list, communication patterns, data flow)
4. What are the non-functional requirements? (SLA, latency, throughput)
5. What are the team constraints? (size, expertise, deployment frequency)
6. What is the deployment model? (Kubernetes, serverless, VMs)
7. What are the data consistency requirements? (strong, eventual, causal)

**Improved Task:** "Review the 5-service microservices architecture for scalability. Services: auth, user, product, order, notification. Communication: REST + async events. Review criteria: can we handle 10x traffic? Current SLA: 99.9%. Team: 5 engineers, deploys weekly. Deployment: Kubernetes. Data: eventual consistency acceptable."

**Final Response Shape:**
```
1. Problem: Review microservices architecture for 10x scalability
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [inferred] REST communication is synchronous (confidence: high)
5. Plan: Review each service for scaling bottlenecks, check inter-service communication patterns
6. Acceptance: Identify scaling bottlenecks, recommend changes for 10x traffic
7. Risks: Async event system may be the bottleneck (not yet confirmed)
```

## Example 5: API Design

**Input:** "Design a user API."

**Classification:** Partially specified

**Pedantic Questions:**
1. What operations are needed? (CRUD, search, bulk operations)
2. What is the authentication method? (API key, JWT, OAuth)
3. What is the request/response format? (JSON, XML, GraphQL)
4. What are the rate limiting requirements?
5. What are the error response formats?
6. Is versioning needed? How? (URL, header, content negotiation)
7. What are the pagination requirements?
8. What are the filtering/sorting requirements?

**Improved Task:** "Design REST API for user management. Operations: CRUD + search. Auth: JWT. Format: JSON. Rate limit: 100 req/min. Errors: RFC 7807. Versioning: URL (/api/v1/). Pagination: cursor-based. Filtering: query params. Sorting: ?sort=field."

**Final Response Shape:**
```
1. Problem: Design REST API for user management
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [assumed] JWT auth with standard claims (confidence: high)
5. Plan: Define endpoints, request/response schemas, error formats, rate limits
6. Acceptance: API design document with all endpoints, schemas, and constraints
7. Risks: Cursor-based pagination may need database support
```

## Example 6: Migration Task

**Input:** "Migrate the database."

**Classification:** Dangerously ambiguous

**Pedantic Questions:**
1. What is the source database? (PostgreSQL, MySQL, MongoDB, etc.)
2. What is the target database?
3. What data needs to be migrated? (schema, records, relationships)
4. What is the migration strategy? (big bang, parallel, strangler fig)
5. What is the downtime budget?
6. What is the rollback strategy?
7. What are the validation steps?
8. Are there data transformations needed?

**Improved Task:** "Migrate from PostgreSQL 13 to PostgreSQL 15. Data: all tables and relationships. Strategy: parallel (dual-write during migration). Downtime: <5 minutes. Rollback: keep PG13 running. Validation: row counts, checksums. No transformations needed."

**Final Response Shape:**
```
1. Problem: Migrate PostgreSQL 13 to PostgreSQL 15 with <5min downtime
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [assumed] Dual-write strategy is acceptable (confidence: high)
5. Plan: Step 1: Set up PG15. Step 2: Enable dual-write. Step 3: Backfill data. Step 4: Switch reads. Step 5: Switch writes. Step 6: Verify. Step 7: Decommission PG13.
6. Acceptance: All data migrated, <5min downtime, row counts match, checksums match
7. Risks: Dual-write may introduce race conditions during transition
```

## Example 7: Security Review

**Input:** "Review the security of the app."

**Classification:** Partially specified

**Pedantic Questions:**
1. What is the scope? (frontend, backend, API, database, infrastructure)
2. What are the compliance requirements? (GDPR, HIPAA, SOC2, PCI-DSS)
3. What data is sensitive? (PII, credentials, tokens, financial)
4. What are the authentication/authorization mechanisms?
5. What are the input validation requirements?
6. What are the encryption requirements? (at rest, in transit)
7. What are the logging/auditing requirements?
8. What are the dependency security requirements?

**Improved Task:** "Review security of user-facing API. Scope: backend API + database. Compliance: GDPR. Sensitive data: email, password hash, session tokens. Auth: JWT + refresh tokens. Input validation: all user inputs. Encryption: TLS 1.3 in transit, AES-256 at rest. Logging: all auth events. Dependencies: latest versions."

**Final Response Shape:**
```
1. Problem: Security review of user-facing API
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [inferred] JWT tokens are stored in httpOnly cookies (confidence: medium)
5. Plan: Review auth flow, input validation, encryption, logging, dependencies
6. Acceptance: Security review report with findings and recommendations
7. Risks: JWT refresh token rotation not yet confirmed
```

## Example 8: Prompt Design

**Input:** "Design a prompt for code generation."

**Classification:** Partially specified

**Pedantic Questions:**
1. What is the input format? (code snippet, natural language, both)
2. What is the output format? (code, explanation, both)
3. What language/framework is the code in?
4. What are the constraints on the output? (length, style, patterns)
5. What is the context window budget?
6. What are the temperature/top_p settings?
7. What are the failure modes? (hallucination, truncation, format errors)
8. What are the evaluation criteria? (accuracy, relevance, completeness)

**Improved Task:** "Design prompt for Python code generation. Input: natural language description. Output: Python code only. Language: Python 3.12+. Constraints: PEP 8, type hints, docstrings. Context: 4096 tokens. Temperature: 0.2. Failure modes: hallucinated imports, syntax errors. Evaluation: passes existing test suite."

**Final Response Shape:**
```
1. Problem: Design prompt for Python code generation from natural language
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [assumed] PEP 8 compliance is required (confidence: high)
5. Plan: Design prompt with input/output format, constraints, examples, and evaluation criteria
6. Acceptance: Prompt generates Python code that passes existing test suite
7. Risks: Hallucinated imports may occur with complex dependencies
```
