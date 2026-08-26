cask "mac-calendar-widget" do
  version "1.1.2"
  sha256 "2b5f6823b6af7738f275908f86f96010bb00cbe064df23897ca0826d4c290eda"

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

  uninstall_postflight do
    system_command "/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister", args: ["-u", "#{appdir}/MacCalendarWidget.app"], sudo: false
    system_command "/usr/bin/pluginkit", args: ["-e", "ignore", "-i", "com.yuhao.MacCalendarWidget.extension"], sudo: false
    system_command "/usr/bin/killall", args: ["chronod", "NotificationCenter"], sudo: false
  end

  zap trash: [
    "~/Library/Application Scripts/com.yuhao.MacCalendarWidget",
    "~/Library/Containers/com.yuhao.MacCalendarWidget",
    "~/Library/Group Containers/group.com.yuhao.MacCalendarWidget",
    "~/Library/Preferences/com.yuhao.MacCalendarWidget.plist",
  ]

  caveats <<~EOS
    首次使用請先開啟「MacCalendarWidget」應用程式允許行事曆存取權限。
    若桌面小組件未立即更新，可執行以下指令重啟小組件服務：
      killall chronod NotificationCenter
  EOS
end
