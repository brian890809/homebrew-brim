cask "brim" do
  version "0.1.0-preview.14"
  sha256 "36e25a242603ad5715986d0987db5580d27a46d4b7f64d9b3f1080c193241f3b"

  url "https://github.com/brian890809/codex-usage-menubar/releases/download/v#{version}/Agent-Usage-#{version}-macos-universal.zip"
  name "Brim"
  desc "Codex and Claude Code usage limits in the MacBook notch"
  homepage "https://github.com/brian890809/codex-usage-menubar"

  # `brew style` prefers `macos: :ventura`, but older Homebrew reads a bare
  # symbol as "exactly Ventura"; ">=" works on both.
  depends_on macos: ">= :ventura"

  # Rename to "Brim.app" once the build ships under the new name.
  app "Agent Usage.app"

  # Brim is not notarized (no paid Apple Developer account yet), so clear the
  # quarantine flag that would otherwise make Gatekeeper block the first launch.
  # Homebrew 7's postflight_steps has no xattr step, so this stays a postflight.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Agent Usage.app"]
  end

  uninstall quit: "com.bchen.CodexUsageMenuBar"

  # Only Brim's own files. Claude Code's ~/.claude and Keychain items are left alone.
  zap trash: [
    "~/Library/Application Support/com.bchen.CodexUsageMenuBar",
    "~/Library/Caches/com.bchen.CodexUsageMenuBar",
    "~/Library/Preferences/com.bchen.CodexUsageMenuBar.plist",
  ]
end
