class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.7/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "1b068eefac8996e563ed19afef52ee1c8cb3c895c4cc1b9086df3c23c0f78aee"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.7/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "e269a690b55e24d38b161a67a4b0bcaaf4c88d4e3b6cfe488424338d65f25879"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.7/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "9fae0ad9f7af6e624edea2442f2d4a19b9d85aa7b42f9c486a2184771e019826"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.7/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "c6c7d1779a0f718579dc58959c4a0171b86162c957e55c7c416fec1f946d772a"
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
