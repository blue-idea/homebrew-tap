cask "linkit" do
  version "0.5.8"
  sha256 "eded46e1edfc7c02058d4cc7a973c6dbd3592082dd8cc1be3a519deda4678fa2"

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
