cask "mac-calendar-widget" do
  version "1.0.0"
  sha256 "88ab768f2b7e82081ba962b561a408b6dd5d09455d447a07a2d8cf9e24cac23b"

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