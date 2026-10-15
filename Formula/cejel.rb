class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.6/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "662f40d57d5404730edcc4c68109e0b352281edb2d9b8fa07c9ebbad343c09df"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.6/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "33bdffd243fa95abd3fd8a8a248a06c0abc0dc3064e537a290f89a4d717da33a"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.6/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "b6b584f3dadcb3b6a0e426ec0818d1ca82687bc9a9b868f46c47a6961184f66b"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.6/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "3c3acf84cdb8a738fedf05cd392993cdf984458d0d22653fe259a52936f1bdfa"
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
