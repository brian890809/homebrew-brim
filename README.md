# Brim Homebrew tap

[Brim](https://github.com/brian890809/codex-usage-menubar) puts your Codex and
Claude Code usage limits in the MacBook notch.

```sh
brew install --cask brian890809/brim/brim
```

Use the full `brian890809/brim/brim` name: Homebrew 7 only loads casks from
taps you trust, and installing by full name trusts this cask.

## First launch

Brim isn't notarized yet, since that needs a paid Apple Developer account, so
macOS blocks the first launch. Clear the quarantine flag once:

```sh
xattr -dr com.apple.quarantine "/Applications/Brim.app"
```

Or open the app, then choose **Open Anyway** in System Settings → Privacy &
Security. The full source is in the main repo if you want to check what it
does first.

## Update and uninstall

```sh
brew upgrade --cask brim
brew uninstall --cask brim          # keeps your saved accounts and settings
brew uninstall --cask --zap brim    # also deletes Brim's settings and saved Claude logins
```

`--zap` only removes Brim's own files. Claude Code's `~/.claude` folder and
Keychain items are left untouched.
