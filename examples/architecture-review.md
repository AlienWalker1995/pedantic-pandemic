# Example: Architecture Review

## Input
"Review the microservices architecture."

## Pedantic Engineer Output

**Classification:** Partially specified

**Questions:**
1. What is the scope of the review? (all services, specific service, inter-service communication)
2. What are the review criteria? (scalability, reliability, maintainability, cost)
3. What is the current architecture? (service list, communication patterns, data flow)
4. What are the non-functional requirements? (SLA, latency, throughput)
5. What are the team constraints? (size, expertise, deployment frequency)
6. What is the deployment model? (Kubernetes, serverless, VMs)
7. What are the data consistency requirements? (strong, eventual, causal)

## Improved Task
"Review the 5-service microservices architecture for scalability. Services: auth, user, product, order, notification. Communication: REST + async events. Review criteria: can we handle 10x traffic? Current SLA: 99.9%. Team: 5 engineers, deploys weekly. Deployment: Kubernetes. Data: eventual consistency acceptable."

## Final Response Shape
```
1. Problem: Review microservices architecture for 10x scalability
2. Ambiguities: None remaining
3. Questions: None
4. Assumptions: [inferred] REST communication is synchronous (confidence: high)
5. Plan: Review each service for scaling bottlenecks, check inter-service communication patterns
6. Acceptance: Identify scaling bottlenecks, recommend changes for 10x traffic
7. Risks: Async event system may be the bottleneck (not yet confirmed)
```
