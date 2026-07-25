class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  version "0.2.0"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.2.0/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "6ce4259cd142d6171f3a937d979de93ff81308543f5279572666c0e136f88d06"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.2.0/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "abfefcff56e9765d26eeeba4fe3bc27cea5a81a3ce6c16ae652d8d93e38d7043"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.2.0/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "20f0992fd074025cfe0737f4083a38598c27c963a81f40ff3e84e11adf278c60"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.2.0/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "4cbed580ccf7f033426659fbf418cb55eee213c64ffa9f639ce122a493e10d88"
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
