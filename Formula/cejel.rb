class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.0/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "93ccc3b640a8ef8a3d9435ae6b5b8afa17920a187146b2e2738a7f01bc9e313b"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.0/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "1519a637aa9a84a5f5300a7ed93bd34e5842aa49c668be37a2f5e30de5bf36ce"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.0/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "beb5783e9d324daef2120349d778da47c5fe8abb1dc497fde242f0e4be9d2977"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.0/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "9d901a0808533281ac7529397de54fbbbe2fd5be0d288217673238ede90d9e24"
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
