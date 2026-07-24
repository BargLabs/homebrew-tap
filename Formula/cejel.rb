class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  version "0.1.9"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.9/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "f00bc6aa557ead97fe1409b0cbb9327982ceba9173502acc172ea8bce0007256"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.9/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "51b815fa3a49d25bd6e62f0853771b0d22519b7ebc3506c5af0d4c091bb91829"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.9/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "7305866ccb202068d0d8e95d56200ed84b9398bf234701ff454e725c96bfe0b3"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.9/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "13a064fc84477ac8993769f3cdde493b6b89512f6bd8e0868e4a645ea3389515"
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
