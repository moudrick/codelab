# Design Rationale & Environment Model

This document explains **how CodeLab environments are built, started, and audited**, and why some responsibilities intentionally belong to the editor (VS Code) rather than the container.

The goal is to avoid the classic trap:

> “Looks impressive, nobody knows what’s inside.”

---

## 1. Separation of responsibilities

CodeLab intentionally separates concerns between three layers:

### 1. Container (Docker / Dev Container)
Responsible for:
- base OS
- language runtime (Go)
- explicitly installed, intentional tools (e.g. `golangci-lint`, `dlv`)
- shell environment
- isolation and reproducibility

The container **does not**:
- install editor-managed tools
- guess user preferences
