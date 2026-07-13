cask "agents-island" do
  version "0.2.0"
  sha256 "ae9873d9a2393d95572e95a11ee1a56e567e855bd7740576eabc070092526009"

  url "https://github.com/mustafahalabi/agents-island/releases/download/v#{version}/AgentsIsland.zip"
  name "Agents Island"
  desc "Dynamic Island for AI coding agents in the MacBook notch"
  homepage "https://github.com/mustafahalabi/agents-island"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "AgentsIsland.app"

  # Releases are ad-hoc signed (no Apple Developer ID yet); clear the
  # quarantine flag so first launch doesn't hit the Gatekeeper dialog.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{appdir}/AgentsIsland.app"],
                   sudo: false
  end

  uninstall quit: "dev.mustafa.agents-island"

  zap trash: [
    "~/Library/Application Support/AgentsIsland",
    "~/Library/Preferences/dev.mustafa.agents-island.plist",
    "~/.claude/agents-island",
  ]

  caveats <<~EOS
    Agents Island lives in the notch / menu bar — there is no Dock icon.
    First click-to-jump asks for Automation permission; approving prompts
    in Terminal.app additionally needs Accessibility.
  EOS
end
