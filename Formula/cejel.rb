class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.5.0/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "a1b839618975b42ba332a1ab0dc1b9b485dbef4e274b7efddd126ec5cce9f500"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.5.0/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "aad3e555588ed350510386c7b9dbd80f4ed0db4c466f02b058641ddb83ae5b11"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.5.0/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "52837c111686ce7b7bdcb51e7f9f3ee92c1e9423957965b12b2efbc47bba9ccb"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.5.0/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "8867731e61460b59b6a4fbb63dde47965a9f53d820b5b4963a120656e643de45"
    end
  end

  def install
    binary = Dir["cejel-*"].first
    odie "Cejel binary is missing from the release artifact" unless binary

    bin.install binary => "cejel"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/cejel --version").strip
    assert_match "trust certificate", shell_output("#{bin}/cejel --help")
  end
end
