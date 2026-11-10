class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.11/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "b71ef615f03b9f1cd951266a0ee0220db2e417f59d6afb5bc1751521c38add6f"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.11/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "9267cafad143bcd1f0a3f34972431fc9db131754502d9225856c79b207e6cb5a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.11/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "9749e2f1fa78db67d0371cffe101b51589c16aa042942b46c7096af767b9a1c5"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.11/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "7d3fe40957650b416bf0e7f1e05aff4db9472b5c2ae1f3b806b5899be1eb69d1"
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
