cask "cyclope" do
  version "0.0.8"
  sha256 "aa977718e70d0e012832646286627d2fed666f44414a3a4e44657476dd62ee92"

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
