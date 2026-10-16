cask "brim" do
  version "0.1.0-preview.14"
  sha256 "36e25a242603ad5715986d0987db5580d27a46d4b7f64d9b3f1080c193241f3b"

  url "https://github.com/brian890809/codex-usage-menubar/releases/download/v#{version}/Agent-Usage-#{version}-macos-universal.zip"
  name "Brim"
  desc "Codex and Claude Code usage limits in the MacBook notch"
  homepage "https://github.com/brian890809/codex-usage-menubar"

  depends_on macos: :ventura

  # Rename to "Brim.app" once the build ships under the new name.
  app "Agent Usage.app"

  uninstall quit: "com.bchen.CodexUsageMenuBar"

  # Only Brim's own files. Claude Code's ~/.claude and Keychain items are left alone.
  zap trash: [
    "~/Library/Application Support/com.bchen.CodexUsageMenuBar",
    "~/Library/Caches/com.bchen.CodexUsageMenuBar",
    "~/Library/Preferences/com.bchen.CodexUsageMenuBar.plist",
  ]

  caveats <<~EOS
    Brim isn't notarized yet, so macOS blocks its first launch. Either run:
      xattr -dr com.apple.quarantine "#{appdir}/Agent Usage.app"
    or open it once, then allow it in System Settings → Privacy & Security.
  EOS
end
