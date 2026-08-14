class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.2/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "f266a4c66d31b2231671cc7db5de0bc317c870175f326b658e3d93a602cb8e21"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.2/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "16b943323ccb66a1a3ff45ddf7febac3328bb34713ca4808661990ccc9ac2c64"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.2/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "46b32819f5bb7158c3ecaa99bf1b5cf600c0e4aab3af19eff3a2675a21065c6f"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.2/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "6c047b4fbbd89dbeecc817490516a95e0e6b41adeb1d5c27b84a3410b49638ff"
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
