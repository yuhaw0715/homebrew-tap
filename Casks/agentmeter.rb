cask "agentmeter" do
  version "1.0.1"
  sha256 "5fc27043da1ddf72d26d363bdff18797c88ce809666988107964aca54972fa17"

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
