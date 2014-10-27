require "formula"

class Tokumx < Formula
  homepage "http://www.tokutek.com/tokumx-for-mongodb"
  version "2.0.0-boxen1"
  conflicts_with "mongodb"
  url "https://s3.amazonaws.com/tokumx-2.0.0/tokumx-2.0.0-osx-x86_64-main.tar.gz"
  sha1 "ad575f0868a778bca45eea404346e9823d6d5ef2"

  raise FormulaSpecificationError, 'Formula requires Mavericks or Yosemite (OSX 10.9 or 10.10)' unless MacOS.version >= :mavericks

  def install
    bin.install Dir["bin/*"]
    (prefix+'lib64').install Dir["lib64/*"]
    share.install Dir["scripts"]
    doc.install "GNU-AGPL-3.0", "THIRD-PARTY-NOTICES", "NEWS", "README", "README-TOKUKV"

    (var+"tokumx").mkpath
    (var+"log/tokumx").mkpath
    (var+"run/tokumx").mkpath
  end

  test do
    system "#{bin}/mongod", "--sysinfo"
  end
end
