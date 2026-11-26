cask "buildui" do
  version "0.1.2"
  sha256 "d2f353e3c5aa35d9298df93f79f775216c65abdcc07f54b971d662f988511649"

  url "https://github.com/blue-idea/BuildUI/releases/download/v#{version}/BuildUI.dmg"
  name "BuildUI"
  desc "AI Native App Builder built with Wails and React"
  homepage "https://github.com/blue-idea/BuildUI"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on :macos

  app "BuildUI.app"

  # 安装后仅清理 BuildUI.app 的隔离属性，避免影响其他应用。
  postflight_steps do
    run "/usr/bin/xattr",
        args: ["-dr", "com.apple.quarantine", "{{appdir}}/BuildUI.app"]
  end

  zap trash: [
    "~/Library/Application Support/BuildUI",
    "~/Library/Caches/com.wails.buildui",
    "~/Library/Preferences/com.wails.buildui.plist",
    "~/Library/Saved Application State/com.wails.buildui.savedState",
  ]
end
