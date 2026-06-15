# Golden Examples

## Golden Example 1: Feature Request

**Input:** "Add user search."

**Output:**
```
## 1. Problem Restatement
Add a search feature for users in the system.

## 2. Ambiguities Detected
- Search scope: search by name, email, username, or all fields?
- Search type: exact match, substring, fuzzy, or full-text?
- Performance: acceptable latency for search results?
- Pagination: how many results per page? cursor-based or offset?
- Sorting: default sort order? customizable?
- Scope: search all users or only visible users (permission-based)?

## 3. Pedantic Questions
1. What exact outcome should be true? (e.g., "Users can find other users by typing their name")
2. What fields are searchable? (name, email, username, bio, tags)
3. What search algorithm? (exact match, substring, fuzzy, full-text)
4. What is the performance budget? (e.g., "Results in under 200ms")
5. How are results paginated? (cursor-based, offset, infinite scroll)
6. Are there permission filters? (search only visible users, or all users)
7. What happens with no results? (empty state message, suggestions)

## 4. Provisional Assumptions
- [assumed] Search is by name and email fields (confidence: medium)
- [inferred] Results are paginated with cursor-based pagination (confidence: low)

## 5. Recommended Plan
1. Define search API endpoint (GET /api/users?query=...)
2. Implement search logic (substring match on name/email)
3. Add pagination support
4. Add empty state handling
5. Add performance monitoring

## 6. Acceptance Criteria
- Search returns results for name and email queries
- Results are paginated (default 20 per page)
- Search completes in under 200ms for <10k users
- Empty state shows "No users found" message

## 7. Risks / Edge Cases
- Special characters in search query (e.g., "O'Brien")
- Very long search queries (truncation?)
- Case sensitivity (should "john" match "John"?)
- Unicode characters in names
```

## Golden Example 2: Bug Report

**Input:** "Login fails sometimes."

**Output:**
```
## 1. Problem Restatement
User login fails intermittently.

## 2. Ambiguities Detected
- "Sometimes" is undefined (frequency, conditions)
- Error type is unspecified (HTTP 401, 500, timeout, redirect loop)
- Affected users are unspecified (all users, specific subset)
- Environment is unspecified (production, staging, local)

## 3. Pedantic Questions
1. What is the exact error? (HTTP status, error message, stack trace)
2. How often does it fail? (percentage of login attempts)
3. Under what conditions does it fail? (specific browser, network, time of day)
4. Which users are affected? (all users, specific roles, specific regions)
5. What changed recently? (deployment, config change, dependency update)
6. Are there logs available? Where?
7. What is the impact? (user blocked, retry succeeds, data loss)

## 4. Provisional Assumptions
- [inferred] Error is HTTP 401 Unauthorized (confidence: medium)
- [assumed] Affects all users (confidence: low)

## 5. Recommended Plan
1. Collect error logs from the past 7 days
2. Identify pattern in failures (time, user, browser, network)
3. Reproduce in staging
4. Implement fix
5. Add monitoring for login failures

## 6. Acceptance Criteria
- Login failure rate drops below 1%
- No user reports login failures for 7 days
- Monitoring alert fires if failure rate exceeds 5%

## 7. Risks / Edge Cases
- Race condition in auth token validation
- Session store capacity issue
- DNS resolution failure in specific regions
- Clock skew between auth server and client
```

## Golden Example 3: Refactor

**Input:** "Refactor the payment module to support multiple currencies."

**Output:**
```
## 1. Problem Restatement
Refactor the payment module to support multiple currencies.

## 2. Ambiguities Detected
- Currency support scope: which currencies? (ISO 4217 subset, all?)
- Exchange rate source: hardcoded, API, database?
- Precision: how many decimal places per currency?
- Display: user-facing currency display format?
- Storage: store amounts in cents/lowest denomination or as decimals?
- Backward compatibility: existing transactions in original currency?

## 3. Pedantic Questions
1. What exact outcome should be true? (e.g., "Users can pay in USD, EUR, GBP")
2. Which currencies are supported initially?
3. Where do exchange rates come from? (API, database, hardcoded)
4. How are amounts stored? (integer cents, decimal with precision)
5. What is the display format per currency? (locale-specific)
6. How are existing transactions handled? (migrated, dual-storage, conversion on read)
7. What is the precision per currency? (some currencies have 0 decimal places)
8. Are there rounding rules? (banker's rounding, floor, ceiling)
9. What is the performance impact of currency conversion?
10. Is there a currency conversion fee?

## 4. Provisional Assumptions
- [assumed] Initial currency set is USD, EUR, GBP, JPY (confidence: medium)
- [inferred] Exchange rates come from a third-party API (confidence: low)
- [assumed] Amounts stored as integers in lowest denomination (confidence: high)

## 5. Recommended Plan
1. Define currency data model (ISO code, name, symbol, decimal places)
2. Implement exchange rate service (API integration, caching)
3. Refactor payment amounts to use integer lowest-denomination storage
4. Add currency conversion logic with rounding rules
5. Update payment UI for locale-specific display
6. Migrate existing transactions
7. Add tests for edge cases (rounding, precision, conversion)

## 6. Acceptance Criteria
- Payments work in all supported currencies
- Exchange rates are cached and refreshed hourly
- Existing transactions are preserved and displayable
- Rounding is consistent across all currencies
- No precision loss in conversions

## 7. Risks / Edge Cases
- Exchange rate API downtime (fallback rates?)
- Rounding differences between currencies
- Historical exchange rates for past transactions
- Currency with 0 decimal places (JPY)
- Very large amounts (integer overflow?)
- Negative amounts (refunds)
```

## Golden Example 4: API Design

**Input:** "Design an API for file uploads."

**Output:**
```
## 1. Problem Restatement
Design an API for uploading files.

## 2. Ambiguities Detected
- File size limits
- Supported file types
- Upload method (single file, multiple files, chunked)
- Authentication
- Response format
- Storage backend
- File naming/organization
- Progress tracking
- Error handling

## 3. Pedantic Questions
1. What is the maximum file size? (e.g., "10MB per file")
2. What file types are supported? (MIME types, extensions)
3. Single file or multiple files per request?
4. Is chunked upload needed? (for large files)
5. What authentication is required? (API key, JWT, session)
6. How are files stored? (S3, local disk, database BLOB)
7. How are files named/organized? (UUID, original name, path structure)
8. Is upload progress tracked? (progress endpoint, WebSocket)
9. What are the error responses? (413, 415, 500)
10. Are there virus/scanning requirements?
11. Is there a delete endpoint?
12. Are there access control requirements? (public, private, shared)

## 4. Provisional Assumptions
- [assumed] Max file size is 10MB (confidence: medium)
- [inferred] Files stored in S3 (confidence: low)
- [assumed] JWT authentication (confidence: medium)

## 5. Recommended Plan
1. Define upload endpoint (POST /api/files)
2. Define file metadata schema
3. Define error response format
4. Define chunked upload endpoint (if needed)
5. Define file access endpoint (GET /api/files/:id)
6. Define delete endpoint (DELETE /api/files/:id)
7. Define progress endpoint (GET /api/uploads/:id/progress)
8. Define access control model

## 6. Acceptance Criteria
- Single file upload works for files up to 10MB
- Supported MIME types are validated
- Error responses follow RFC 7807
- Files are stored with UUID names
- Upload progress is trackable
- Files can be deleted

## 7. Risks / Edge Cases
- Large file uploads (timeout, memory)
- Concurrent uploads of same file
- File type spoofing (extension vs. content)
- Storage quota exceeded
- Virus scanning integration
- CDN caching of uploaded files
- File deletion vs. soft delete
```

## Golden Example 5: Migration

**Input:** "Migrate the user database."

**Output:**
```
## 1. Problem Restatement
Migrate the user database.

## 2. Ambiguities Detected
- Source and target databases
- Data volume
- Migration strategy
- Downtime budget
- Rollback strategy
- Validation criteria
- Data transformations
- Indexes and constraints
- Foreign key relationships

## 3. Pedantic Questions
1. What is the source database? (PostgreSQL, MySQL, MongoDB)
2. What is the target database?
3. How many user records? (scale affects strategy)
4. What is the downtime budget? (zero, minutes, hours)
5. What is the migration strategy? (big bang, parallel, strangler fig)
6. What is the rollback strategy?
7. What data transformations are needed? (schema changes, field renames)
8. Are there indexes and constraints to migrate?
9. What are the validation criteria? (row counts, checksums, sampling)
10. Are there foreign key relationships to other tables?
11. What is the deployment order? (schema first, then data?)
12. Are there application changes needed during migration?

## 4. Provisional Assumptions
- [inferred] Source is PostgreSQL, target is PostgreSQL (confidence: medium)
- [assumed] Downtime budget is <5 minutes (confidence: low)
- [assumed] Big bang migration strategy (confidence: medium)

## 5. Recommended Plan
1. Define source and target schemas
2. Create migration script (schema + data)
3. Test migration in staging
4. Schedule maintenance window
5. Run migration
6. Validate (row counts, checksums, sampling)
7. Switch application to new database
8. Rollback if validation fails

## 6. Acceptance Criteria
- All user records migrated
- Row counts match between source and target
- Checksums match for critical fields
- Application works with new database
- Rollback completes in <10 minutes if needed

## 7. Risks / Edge Cases
- Data loss during migration
- Schema incompatibility
- Index rebuild time
- Foreign key constraint violations
- Application connection pool exhaustion during migration
- Partial migration (some records migrated, some not)
- Character encoding issues
```
