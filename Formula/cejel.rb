class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.10/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "00650b4d0aa58c902a8c2c2e92f1151eda2fb24bae926b030043f0606d8bc0b3"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.10/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "e7a8ba2add5bdcc85a8c49a99528ec8ed58e743b3f9290993add15e7cb4d86e8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.10/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "4a624b1248075aae977ac10ca2870aa6a4db3a8b3042c7c95845842046b08125"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.10/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "6146624cb840413c944aec12bc0de9b78a8488a502d474a99e3ae0b54aefb8dc"
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
