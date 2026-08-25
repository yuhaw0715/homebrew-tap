cask "mac-calendar-widget" do
  version "1.1.0"
  sha256 "851e3b8680b5cbe46c9a0744c1a4409b777b66abd0fed21fd77d274ea506f253"

  url "https://github.com/yuhaw0715/MacCalendarWidget/releases/download/v#{version}/MacCalendarWidget-v#{version}.zip"
  name "MacCalendarWidget"
  desc "macOS 原生桌面行事曆小組件，支援 iCloud 與 Google 同步"
  homepage "https://github.com/yuhaw0715/MacCalendarWidget"

  depends_on macos: ">= :sonoma"

  app "MacCalendarWidget.app"

  zap trash: [
    "~/Library/Application Scripts/com.yuhao.MacCalendarWidget",
    "~/Library/Containers/com.yuhao.MacCalendarWidget",
    "~/Library/Preferences/com.yuhao.MacCalendarWidget.plist",
  ]
end