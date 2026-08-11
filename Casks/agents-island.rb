cask "agents-island" do
  version "0.7.1"
  sha256 "379986933eeac6bb1b8c66cd61d1adaa62471a01424703523a4b35c2bb88668c"

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
