# Changelog

## Unreleased

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
