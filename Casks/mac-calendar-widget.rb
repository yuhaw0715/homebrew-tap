cask "mac-calendar-widget" do
  version "1.1.1"
  sha256 "534c301627fa8f401b2f9e08ce0b761a05d2abfc582e130a2d4a0629c9b2ff74"

  url "https://github.com/yuhaw0715/MacCalendarWidget/releases/download/v#{version}/MacCalendarWidget-v#{version}.zip"
  name "MacCalendarWidget"
  desc "macOS 原生桌面行事曆小組件，支援 iCloud 與 Google 同步"
  homepage "https://github.com/yuhaw0715/MacCalendarWidget"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "MacCalendarWidget.app"

  zap trash: [
    "~/Library/Application Scripts/com.yuhao.MacCalendarWidget",
    "~/Library/Containers/com.yuhao.MacCalendarWidget",
    "~/Library/Preferences/com.yuhao.MacCalendarWidget.plist",
  ]

  caveats <<~EOS
    若首次開啟時出現「無法打開」或「Apple 無法檢查惡意軟體」提示，請在終端機執行以下指令解除隔離：
      xattr -cr /Applications/MacCalendarWidget.app
    或在 macOS「系統設定 ➔ 隱私權與安全性」中點擊「仍要開啟」。
  EOS
end