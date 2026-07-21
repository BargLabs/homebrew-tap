class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  version "0.1.8"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.8/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "80ea2bd3060b5d2442aad38e662ec6ec5bf8cec1cb97f9fd22dd4fd73f0279fe"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.8/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "3c9a7be5dd137354121fe19e889fad7c8ce5d7b11a694a825d9319cfc9b4f3ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.8/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "428c4632ba856445c1919dfc8324a7b8d593cc6f1f93da8f0ccedb954635af2a"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.8/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "1070cd200edaefe924accb9fa9402486820447d7b937a860d12f7c85df5715cc"
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
