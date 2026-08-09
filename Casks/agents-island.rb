cask "agents-island" do
  version "0.7.0"
  sha256 "377e2722d2376337fcb3bc36c93d13fb956461f8c24f7b657f664a5b52c1c2a0"

  url "https://github.com/mustafahalabi/agents-island/releases/download/v#{version}/AgentsIsland.zip"
  name "Agents Island"
  desc "Dynamic Island for AI coding agents in the MacBook notch"
  homepage "https://github.com/mustafahalabi/agents-island"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :sonoma

  app "AgentsIsland.app"

  uninstall quit: "dev.mustafa.agents-island"

  zap trash: [
    "~/.claude/agents-island",
    "~/Library/Application Support/AgentsIsland",
    "~/Library/Preferences/dev.mustafa.agents-island.plist",
  ]

  caveats <<~EOS
    Agents Island lives in the notch / menu bar — there is no Dock icon.
    First click-to-jump asks for Automation permission; approving prompts
    in Terminal.app additionally needs Accessibility.
  EOS
end
