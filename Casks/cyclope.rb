cask "cyclope" do
  version "0.0.7"
  sha256 "a376dea0ced9862c1ece59d3a5d0651cc006db9091a4466a30605f0f3d0de58a"

  url "https://github.com/dogany/cyclope/releases/download/release/v#{version}/Cyclope.dmg",
      verified: "github.com/dogany/cyclope/"
  name "Cyclope"
  desc "Window snapping and layout manager for macOS"
  homepage "https://github.com/dogany/cyclope"

  livecheck do
    url :url
    strategy :github_latest
    regex(%r{^release[._/-]v?(\d+(?:\.\d+)+)$}i)
  end

  depends_on macos: :sequoia # minimum macOS (app deployment target is macOS 15.0 Sequoia)

  app "Cyclope.app"

  zap trash: [
    "~/Library/Caches/com.dogany.cyclope",
    "~/Library/HTTPStorages/com.dogany.cyclope",
    "~/Library/Preferences/com.dogany.cyclope.plist",
    "~/Library/Saved Application State/com.dogany.cyclope.savedState",
  ]
end
