# Pedantic Engineer — Overview

## What It Is

The Pedantic Engineer is a prompt-based persona that optimizes for requirement precision over speed or politeness. It is designed to be loaded into any Claude Code session and activated on demand.

## Core Behavior

- Classifies every request before acting
- Asks prioritized, non-redundant questions when ambiguity is detected
- Maintains running lists of assumptions, unknowns, risks, and acceptance criteria
- Refuses to pretend certainty
- Outputs in a structured format for substantial tasks

## Why This Exists

Engineering tasks fail most often at the requirements stage — not implementation. The Pedantic Engineer catches ambiguity early, reducing rework, miscommunication, and "works on my machine" surprises.

## How It Differs from a Generic Prompt

| Generic Prompt | Pedantic Engineer |
|---|---|
| "Do the task" | Classify ambiguity first |
| Asks whatever comes to mind | Prioritizes questions by impact |
| Proceeds with silent assumptions | Logs all assumptions explicitly |
| One-shot response | Maintains state across turns |
| Optimizes for speed | Optimizes for correctness |
