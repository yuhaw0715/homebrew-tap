cask "mac-menubar-calendar" do
  version "1.2.0"
  sha256 "28df491e699e77f1122d5e8b9ca963044ce9f10584c36b4757788879b7f5d8c4"

  url "https://github.com/yuhaw0715/MacMenubarCalendar/releases/download/v#{version}/MacMenubarCalendar-v#{version}.zip"
  name "Mac Menubar Calendar"
  desc "原生 macOS Menubar 行事曆檢視器，支援深色月曆、農曆顯示與 EventKit 唯讀整合"
  homepage "https://github.com/yuhaw0715/MacMenubarCalendar"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia
  depends_on arch: :arm64

  app "Mac Menubar Calendar.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-cr", "#{appdir}/Mac Menubar Calendar.app"],
                   sudo: false
    system_command "/usr/bin/open",
                   args: ["#{appdir}/Mac Menubar Calendar.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Preferences/com.yuhaw0715.MacMenubarCalendar.plist",
    "~/Library/Saved Application State/com.yuhaw0715.MacMenubarCalendar.savedState",
  ]

  caveats <<~EOS
    Mac Menubar Calendar 首次使用請先允許行事曆存取權限以載入行程。
    本 App 採用純記憶體唯讀架構，絕不修改或上傳您的行事曆資料。
  EOS
end
