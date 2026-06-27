cask "cyclope" do
  version "1.0.0"
  sha256 "5483a31ff765b85b793ab452e7bc96854fea9bfce2edfc9e13a11ccf8fa44a4f"

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
