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

  postflight do
    system_command "/usr/bin/xattr", args: ["-cr", "#{appdir}/MacCalendarWidget.app"], sudo: false
    system_command "/usr/bin/pluginkit", args: ["-a", "#{appdir}/MacCalendarWidget.app/Contents/PlugIns/MacCalendarWidgetExtension.appex"], sudo: false
    system_command "/usr/bin/open", args: ["#{appdir}/MacCalendarWidget.app"], sudo: false
  end

  zap trash: [
    "~/Library/Application Scripts/com.yuhao.MacCalendarWidget",
    "~/Library/Containers/com.yuhao.MacCalendarWidget",
    "~/Library/Preferences/com.yuhao.MacCalendarWidget.plist",
  ]

  caveats <<~EOS
    首次使用請先開啟「MacCalendarWidget」應用程式允許行事曆存取權限。
    若桌面小組件未立即更新，可執行以下指令重啟小組件服務：
      killall chronod NotificationCenter
  EOS
end