# Changelog

## Unreleased

## 1.0.0 (2026-02-13)

*   Drop Ruby 2.7, 3.0 and 3.1 support.
*   Add Ruby 3.3, 3.3 and 4.0 support.
*   Update runtime dependencies.
*   Update development dependencies.
*   Resolve new RuboCop offenses.
*   Improve CI config.

## 0.8.0 (2023-11-02)

*   Drop Ruby 2.6 support.
*   Add Ruby 3.2 for CI.
*   Update `toys` dependencies.
*   Move development dependencies from `gemspec` into `Gemfile`.
*   Update development dependencies.

## 0.7.0 (2022-10-22)

*   Update `toys-core`.
*   Update `rubocop`.
*   Improve CI.
*   Update badges in README.

## 0.6.1 (2022-09-24)

*   Allow `gorilla_patch` version 5.
*   Update `filewatcher-matrix` to version 1.0.
*   Improve CI.

## 0.6.0 (2022-09-01)

*   Add Ruby 3.1 for CI.
*   Drop Ruby 2.5 support.
*   Update dependencies.
*   Update metadata in gem specification.

## 0.5.0 (2021-10-29)

*   Update dependencies.

## 0.4.0 (2021-04-30)

*   Add Ruby 3 support.
*   Update dependencies.

## 0.3.0 (2020-12-02)

*   Replace spawn of `filewatcher-cli` and pids files with `filewatcher-matrix`
    It can be kind of standard and work better.
*   Update dependencies.

## 0.2.2 (2020-09-23)

*   Fix `status` command.

## 0.2.1 (2020-08-24)

*   Fix system calls.

## 0.2.0 (2020-08-23)

*   Update `toys`.

## 0.1.1 (2020-08-21)

*   Wrap `sh` into `Bundler.with_unbundled_env`.
    See <https://github.com/dazuma/toys/issues/65>.
*   Deny `phased-restart` when there is no `prune_bundler` in Puma's config.

## 0.1.0 (2020-08-02)

*   Initial release.
