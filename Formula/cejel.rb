class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.11/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "c8578acc9b9a1e1e88db615bd686499e080484c44492c35f53f6459dad434333"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.11/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "07bc1eb303b7aa85500531c8195a24b8e043aac69c8c0fb4d1728fa1ebf262b8"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.11/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "64497a535eb287b6f0372f76224c680b2b96f5e9fc2d4f7a0a3668c2c6730b61"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.11/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "aee4d0846328f784f7f78a9c16ee1e10107801e120803438a6687781ee7443ba"
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
