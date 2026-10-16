cask "brim" do
  version "0.1.0-preview.15"
  sha256 "d58152a28fa24e20ef5de9f78de0e76dfe20ac4a75032a4a462080417d6cf0e6"

  url "https://github.com/brian890809/codex-usage-menubar/releases/download/v#{version}/Brim-#{version}-macos-universal.zip"
  name "Brim"
  desc "Codex and Claude Code usage limits in the MacBook notch"
  homepage "https://github.com/brian890809/codex-usage-menubar"

  depends_on macos: :ventura

  app "Brim.app"

  uninstall quit: "com.bchen.CodexUsageMenuBar"

  # Only Brim's own files. Claude Code's ~/.claude and Keychain items are left alone.
  zap trash: [
    "~/Library/Application Support/com.bchen.CodexUsageMenuBar",
    "~/Library/Caches/com.bchen.CodexUsageMenuBar",
    "~/Library/Preferences/com.bchen.CodexUsageMenuBar.plist",
  ]

  caveats <<~EOS
    Brim isn't notarized yet, so macOS blocks its first launch. Either run:
      xattr -dr com.apple.quarantine "#{appdir}/Brim.app"
    or open it once, then allow it in System Settings → Privacy & Security.
  EOS
end
