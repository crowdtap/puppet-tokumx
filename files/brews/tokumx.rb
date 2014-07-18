require "formula"

class Tokumx < Formula
  homepage "http://www.tokutek.com/products/tokumx-for-mongodb"
  version "1.5.0-boxen1"
  conflicts_with "mongodb"
  url "https://s3.amazonaws.com/tokumx-1.5.0/tokumx-1.5.0-osx-x86_64-main.tar.gz"
  sha1 "4151a40a6f81c1cb3c226ae24ae429f897609cbb"

  raise FormulaSpecificationError, 'Formula requires Mavericks (OSX 10.9)' unless MacOS.version == :mavericks

  def install
    bin.install Dir["bin/*"]
    lib.install Dir["lib64/*"]
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
