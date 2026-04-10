# Changelog

## [0.2.0] - 2026-04-08

### Added
- Added a formal engineering execution blueprint for static analysis, dependency mapping, and structured refactoring governance in `docs/review/ENGINEERING_REVIEW_BLUEPRINT.md`.
- Added initial Architecture Decision Record for quality gates and compatibility requirements in `docs/adr/ADR-0001-quality-gates-and-compatibility.md`.
- Added analysis automation scripts for file hashing, dependency graph generation, and static-analysis orchestration under `scripts/analysis/`.
- Added a CI workflow (`.github/workflows/quality-gates.yml`) to execute quality checks and archive artifacts.

### Changed
- Expanded root `README.md` with an execution model, quality lifecycle, and explicit deliverables aligned with enterprise-grade review and restructuring practices.
- Extended `CONTRIBUTING.md` with quality gates, mandatory artifacts, and engineering process controls.
