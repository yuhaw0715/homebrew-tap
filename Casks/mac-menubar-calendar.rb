cask "mac-menubar-calendar" do
  version "1.1.0"
  sha256 "215bd944c63ef87bd5e1f69ebc7278e884d9869211d3e38cbfb593ce3a2f9a99"

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
                   args: ["-d", "com.apple.quarantine", "#{appdir}/Mac Menubar Calendar.app"],
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
