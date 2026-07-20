class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  version "0.1.6"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.6/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "01c8cc71d93949c88a8a9b8d8a79812c24a5341989e3111c770e6387d668fb0d"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.6/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "0a561f81efa1b3e7a735263b01ba1685bafb608ae362cd74bdd1e84b49e0d84c"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.6/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "3ff1605638e8ae9e0a16939ab663f977742af812461a2180b6d80d2cb9ec0759"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.1.6/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "d0c8626bf5c067635a155a524c3e41e1c0054f1f9636c2c95825f043cafdfff8"
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
