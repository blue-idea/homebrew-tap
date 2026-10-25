cask "linkit" do
  version "0.5.3"
  sha256 "959cbe13cd851e1afb1182985df85390eb9b91e1d8913f59ca3323051ef9dc8a"

  url "https://github.com/blue-idea/linkit/releases/download/v#{version}/Linkit.dmg"
  name "Linkit"
  desc "Smart knowledge curation space with AI-assisted organization and cloud sync"
  homepage "https://github.com/blue-idea/linkit"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Linkit.app"

  # 安装后仅清理 Linkit.app 的隔离属性，避免影响其他应用。
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/Linkit.app"]
  end

  zap trash: [
    "~/Library/Application Support/Linkit",
    "~/Library/Caches/com.wails.linkit",
    "~/Library/Preferences/com.wails.linkit.plist",
    "~/Library/Saved Application State/com.wails.linkit.savedState",
  ]
end
