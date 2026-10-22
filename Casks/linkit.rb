cask "linkit" do
  version "0.4.7"
  sha256 "20a55401f5ef9023cc4dfd88614f1328f27bc00a235cd3f2bf4b31b1cd0d593e"

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
