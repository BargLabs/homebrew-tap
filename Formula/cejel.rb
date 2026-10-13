class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.4/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "4c06774664df8c42187733e208bd10fbfdff7186c072cba5ef28cf1f61afb688"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.4/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "6143c12a9e0618293a5f5097f1eb6ee814bdc793e2f871ee32750bfed3ba7e16"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.4/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "917259217b136051473d57a35bf5b73fcab8625bc12a8d5dfb6c90d5dc45ae26"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.4/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "f3a45ac0340c94aeb2a34d52017575758b999a0b46de44264e9d0c9cf200746a"
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
