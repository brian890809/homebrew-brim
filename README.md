# Brim Homebrew tap

[Brim](https://github.com/brian890809/codex-usage-menubar) puts your Codex and
Claude Code usage limits in the MacBook notch.

```sh
brew install --cask brian890809/brim/brim
```

Use the full `brian890809/brim/brim` name: Homebrew 7 only loads casks from
taps you trust, and installing by full name trusts this cask.

## Why the cask clears quarantine

Brim isn't notarized yet, since that needs a paid Apple Developer account. Without
help, macOS would block the first launch until you click **Open Anyway** in
System Settings. The cask's `postflight` runs
`xattr -dr com.apple.quarantine` on the installed app so it opens normally.
The full source is in the main repo if you want to check what it does first.

## Update and uninstall

```sh
brew upgrade --cask brim
brew uninstall --cask brim          # keeps your saved accounts and settings
brew uninstall --cask --zap brim    # also deletes Brim's settings and saved Claude logins
```

`--zap` only removes Brim's own files. Claude Code's `~/.claude` folder and
Keychain items are left untouched.
