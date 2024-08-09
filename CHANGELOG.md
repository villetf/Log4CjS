# Changelog

Alla anteckningar kommer antecknas i denna fil.

## 1.1.1 - 2024-01-04

### Changed

- Fixade så att cors fungerar även för filer i public-mappen.

## 1.1.0 - 2023-11-24

### Added

- Endpoints för SupportTools, OHM och Web Assistant, /api/supporttools/log, /api/ohm/log samt /api/wass/log. 

## 1.0.0 - 2023-11-15

### Added

- Webbserver som tar emot API-anrop på /api/log och skriver metrik till en databas.
- Public-mapp som kan användas för förvaring av exempelvis CjS-skript.