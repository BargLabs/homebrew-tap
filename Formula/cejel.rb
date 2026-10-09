class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.2/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "8a7fb93180f689a947eef96dcb0c022cfdab72b0e0c3d568817867b8a7fe1f8b"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.2/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "ceed999a39195fb0eb7feea61ca08c182dfd5ea8c302b378cba74f3b7925c5bd"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.2/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "9b0aa577adb4c8f71a77a851234dfa5000a149012a420b2ab7bf47a239161c1c"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.2/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "062439545e145b1588056d39ef62164deef8083c6c185e044cbf5cc6fc04625e"
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
