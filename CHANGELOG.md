<!-- markdownlint-disable MD024 -->
# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.2] - 2025-07-18

### Fixed

- Fixed variable validation.

## [3.0.1] - 2025-07-18

### Fixed

- Fixed a typo in the metric block in `main.tf` where `metric.value` was incorrectly used instead of `enabled_metric.value`.

## [3.0.0] - 2025-07-18

## Breaking Changes

- Switch the `enabled_metric` block to the new `metric` block, as the `enabled_metric` block is deprecated in the latest version of the AzureRM provider.
- Drop support for azure provider version `3.x` and require at least version `4.0.0`.

## [2.0.0] - 2024-07-15

### Added

- The `enable_logs` variable, which is `true` by default. Disables diagnostic parameter logs if set to `false`.

### Remove

- The variable `retention_days` is not used with Log Analytics and is now [obsolete](https://learn.microsoft.com/en-us/azure/azure-monitor/essentials/migrate-to-azure-storage-lifecycle-policy?tabs=portal).

## [1.0.0] - 2023-03-09

### Added

- Initial Release with warning fix for enabled log
