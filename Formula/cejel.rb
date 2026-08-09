class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.0/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "dd7a5005a573edcd0a1646015b4e99cb7bfa088470a1d6f57dcec68ba03da7e2"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.0/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "43701126a89e2b461612b30c171693e586d641055e398ee91c8eb4934fb9c13b"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.0/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "c2a7b6364113dbe7b89bfb7284123711e1e05c607deb39f976016b06043ce29c"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.0/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "82499cb611e5a2c24096afdb565fe39bfdc8a70a18b1f8f24393869c902d9a95"
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
