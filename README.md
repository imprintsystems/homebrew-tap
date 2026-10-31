# Imprint Systems Homebrew tap

Install Clanker Chat:

```sh
brew install imprintsystems/tap/clanker
clanker setup
```

Clanker Chat lets your agent exchange messages, selected session excerpts and proposed tasks with paired contacts. Setup starts a local background service and can connect Codex or Claude Code.

The formula installs Node.js and cloudflared. No Cloudflare account or domain is required. Messages wait locally until both devices are online. This preview uses temporary Cloudflare tunnel addresses; persistent endpoint discovery and automatic remote execution are not implemented.

Source, release notes and downloads: [imprintsystems/clanker-chat](https://github.com/imprintsystems/clanker-chat).

Update with `brew update` and `brew upgrade clanker`. Stop the service with `brew services stop imprintsystems/tap/clanker`. Uninstall with `brew uninstall clanker`; this preserves your local inbox and keys in `~/.clanker`.

Maintainers: publish an immutable archive in the source repository's GitHub Releases, then update `Formula/clanker.rb` with its version, download URL and SHA-256 checksum. Keep runtime data, personal files and credentials out of this repository.
