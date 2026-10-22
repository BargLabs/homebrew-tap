class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.8/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "c1e69f01142ce4bf6ce6932e1f4836f9e7760e7124f36955bd96f8bb893ff1d4"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.8/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "0991fbb8d1059e377ea9cc7947eebf2fd8912547d882791e08b5ff16c7038f57"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.8/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "0923c1c6687ad5daa41b560053a3a5c4742ba167c75b3c4489d0256cb977455d"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.8/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "16edb37adbabc29b0bfff2ec261d4189a851406c009958f80c9a9d5cae8c257e"
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
