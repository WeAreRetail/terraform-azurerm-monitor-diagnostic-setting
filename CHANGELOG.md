# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2024-07-15

### Added
- The `enable_logs` variable, which is `true` by default. Disables diagnostic parameter logs if set to `false`.

### Remove

- The variable `retention_days` is not used with Log Analytics and is now [obsolete](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/migrate-to-azure-storage-lifecycle-policy?tabs=portal).


## [1.0.0] - 2023-03-09

### Added

- Initial Release with warning fix for enabled log
