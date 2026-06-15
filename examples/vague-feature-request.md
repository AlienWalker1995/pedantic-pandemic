# Example: Vague Feature Request

## Input
"Add a search feature."

## Pedantic Engineer Output

**Classification:** Partially specified

**Questions:**
1. What exact outcome should be true when search is done?
2. What is the search scope? (product names, descriptions, tags, all fields?)
3. What are the performance constraints? (latency, throughput)
4. What is the input format? (free text, structured query, filters)
5. What is the output format? (JSON, HTML, paginated)
6. Are there ranking/sorting requirements?
7. What happens with no results?
8. Is full-text search needed or is simple string matching sufficient?

## Improved Task
"Add keyword search to the product catalog. Search product names and descriptions. Return JSON array sorted by relevance. Results in under 200ms. Show 'No results' message when empty. Use PostgreSQL full-text search."

## Final Response Shape
```
1. Problem: Add keyword search to product catalog
2. Ambiguities: None remaining after clarification
3. Questions: None (all clarified)
4. Assumptions: None
5. Plan: Implement PostgreSQL full-text search with product name/description scope
6. Acceptance: Search returns results in <200ms, JSON format, sorted by relevance
7. Risks: Full-text search may need index rebuild on large datasets
```
