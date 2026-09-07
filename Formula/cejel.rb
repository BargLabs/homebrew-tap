class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.7/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "11b0988a2a129ad47c122d6c1cef183e0f65261f6817b320216112299495bfab"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.7/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "df58825b8022d85fb58211a41d27708483f3321ece0079a293265bf116f83430"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.7/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "55593f98d97a409a6dc91c7db4e96a8545be1499cf1fdb7575dec95dffea109c"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.7/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "c87fe94f4c4de3e493edc92e9f44f36822a1471641b9d92084ea13ce6d4cabfc"
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
