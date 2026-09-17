class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.10/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "590fe776dc4f4f69d67c9d91c5821ef4e601ef6d9112dddbf9a866db310f5f1b"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.10/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "51306912213a87afd81337e90a00633b8c2758282f456f907f9c99447226bc3d"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.10/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "f1e9195476159e0cf5d1760ab545b0691b1ab617a3c0eb128c266c968eea2cec"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.10/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "525f9cf0b5d2afe8bb1e37e4d617aa54ba8e0f482006935cf4cbd6fd759faaba"
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
