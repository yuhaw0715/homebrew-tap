cask "agentmeter" do
  version "0.1.1"
  sha256 "4aa3f31cdd84c43f9c742336cdd0e89077899543d1ffe29ac8386699e06c5ce1"

  url "https://github.com/yuhaw0715/AgentMeter/releases/download/v#{version}/AgentMeter-v#{version}.zip"
  name "AgentMeter"
  desc "macOS 原生 AI Coding Agent 使用額度監控器"
  homepage "https://github.com/yuhaw0715/AgentMeter"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "AgentMeter.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-d", "com.apple.quarantine", "#{appdir}/AgentMeter.app"],
                   sudo: false
  end

  zap trash: [
    "~/Library/Application Support/com.agentmeter.AgentMeter",
    "~/Library/Caches/com.agentmeter.AgentMeter",
    "~/Library/Preferences/com.agentmeter.AgentMeter.plist",
    "~/Library/Saved Application State/com.agentmeter.AgentMeter.savedState",
  ]

  caveats <<~EOS
    AgentMeter 需要 Codex CLI 及／或 Antigravity CLI 才能讀取使用額度。
    若未能自動找到 CLI，請在 AgentMeter 設定中指定執行檔路徑。
  EOS
end
