cask "whatsize" do
  version "7.7.7"
  sha256 "a6c07db1868e408eafad89aba68a4f775f62583152874f61fc17615b19bdb502"

  url "https://www.whatsizemac.com/software/whatsize#{version.major}/whatsize_#{version}.tgz"
  name "WhatSize"
  desc "File system utility used to view and reclaim disk space"
  homepage "https://www.whatsizemac.com/"

  livecheck do
    url "https://www.whatsizemac.com/software/whatsize#{version.major}/release/notes.xml"
    strategy :sparkle, &:short_version
  end

  depends_on macos: ">= :high_sierra"

  pkg "WhatSize.pkg"

  uninstall pkgutil:   "com.id-design.v#{version.major}.whatsize.pkg",
            launchctl: "com.id-design.v#{version.major}.whatsizehelper"

  zap trash: [
    "/Library/LaunchDaemons/com.id-design.v7.whatsizehelper.plist",
    "/Library/PrivilegedHelperTools/com.id-design.v7.whatsizehelper",
    "~/Library/Application Support/WhatSize",
    "~/Library/Caches/com.id-design.v7.whatsize",
    "~/Library/HTTPStorages/com.id-design.v7.whatsize",
    "~/Library/Logs/WhatSize.log",
    "~/Library/Preferences/com.id-design.v7.whatsize.plist",
    "~/Library/Saved Application State/com.id-design.v7.whatsize.savedState",
  ]
end
