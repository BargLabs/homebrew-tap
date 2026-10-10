class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.3/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "1dbf3ebf7d22950e24b4fa32678eb6f30641722064afb17e34824789a950ee9f"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.3/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "dbea38105619943deee27840e6390ed9ac1770d713075a26ebf69df0a74ebd8a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.3/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "7d7e82ff442c64f607950d99dfda654013a034af6a23de6baa94ad90ba11d0ec"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.3/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "bfa16c697448715672c7cf21a0032479d8499fd6ecfb8a1a61187a2c357720bb"
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
