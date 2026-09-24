cask "better-monitor" do
  version "1.0.3"
  sha256 "0df8ea23d37760970ed6671b43284fe805ded252e49998a64b08dbfa747f93f8"

  url "https://github.com/BetterMacNet/better-monitor/releases/download/v#{version}/BetterMonitor-#{version}.dmg"
  name "Better Monitor"
  desc "System monitor for processes, ports, network, startup items and local AI"
  homepage "https://bettermac.net/"

  # app 内没有自更新，版本发现靠 GitHub 的最新 release tag。
  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sequoia

  app "Better Monitor.app"

  uninstall quit: "net.better.mac.monitor"

  # Keychain 里的 net.better.mac.monitor.ai（AI API Key）zap 删不掉，
  # cask 没有 keychain 指令，需要 app 内提供清除入口。
  zap trash: [
    "~/Library/Application Support/net.better.mac.monitor",
    "~/Library/Application Support/SystemMonitor",
    "~/Library/Caches/net.better.mac.monitor",
    "~/Library/HTTPStorages/net.better.mac.monitor",
    "~/Library/Preferences/net.better.mac.monitor.plist",
    "~/Library/Saved Application State/net.better.mac.monitor.savedState",
  ]
end
