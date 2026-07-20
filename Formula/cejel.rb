class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  version "0.1.7"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.7/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "7afc9fbba2ed05fc6d6a41401295327f8e7fe2f46031f3bcff7b709bfc721dbb"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.7/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "40cd32d17bffa9901f33e82ecedb26218925a3fcc2e87fdbf30e3c06cc0426e1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.7/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "ed101ad5ac84debb1442409706445256deafbb539e003646613707c2c1b4f031"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.7/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "7e2518402652b99097fa2d00ed0bf4ebbcd793e5dd9097d29acabb6ccb065fd7"
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
