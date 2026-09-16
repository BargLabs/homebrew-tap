class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.9/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "6482e23571e2eedd992324a3a9fa46ae7083f4f96315ddafa500cf8a8e61d4e8"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.9/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "14c02704b6e84b95cd14c2987f584b1b2d46fa67a9e47b36fddd3c1289ef2598"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.9/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "619b47b5dc28d4e2763a876389445bd66d1fa7537dc93f300b62a6646a60c676"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.9/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "3c8f3ed06b7b803a310fdf770337ffacf336e7d18baaecdb8a5c3ac7ce1dc662"
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
