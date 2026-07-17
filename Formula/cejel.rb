class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  version "0.1.4"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.4/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "44a26ef1728df1c7276c9d452b66b98c05f415ea0a7cba523150a59d1831520e"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.4/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "bc4f674d4f9144a40b54d35fe59b7a711aef0ef7f588b211037b4b2c859e8848"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.4/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "ceae9d69f103e5682e0a6137d7574e70a999a94dc6a5bd6ea72e19dd9e40f7e0"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.4/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "b40fb6a6da57be0e4c815dca7d8e03237baa5c3f5c90ab3c88be68d7db031ba2"
    end
  end

  def install
    binary = Dir["cejel-*"].first
    odie "Cejel binary is missing from the release artifact" unless binary

    bin.install binary => "cejel"
  end

  test do
    assert_match "trust certificate", shell_output("#{bin}/cejel --help")
  end
end
