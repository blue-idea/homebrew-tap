cask "linkit" do
  version "0.3.4"
  sha256 "9ace74d71abaf6d2f2e5006a2f5e6e03a52ba7d923267ad5392c71a19b1cbe48"

  url "https://github.com/blue-idea/linkit/releases/download/v#{version}/Linkit.zip"
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
