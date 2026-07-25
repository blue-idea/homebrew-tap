cask "linkit" do
  version "0.2.3"
  sha256 "fe60b5b9ca5c5a7d1ada02f079771a1e5bbd2229e2be8a78eed2908baf2d08b7"

  url "https://github.com/blue-idea/collection/releases/download/v#{version}/Linkit.dmg"
  name "Linkit"
  desc "Smart knowledge curation space with AI-assisted organization and cloud sync"
  homepage "https://github.com/blue-idea/collection"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "Linkit.app"

  # 安装后仅清理 Linkit.app 的隔离属性，避免影响其他应用。
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/Linkit.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/Linkit",
    "~/Library/Caches/com.wails.linkit",
    "~/Library/Preferences/com.wails.linkit.plist",
    "~/Library/Saved Application State/com.wails.linkit.savedState",
  ]
end
