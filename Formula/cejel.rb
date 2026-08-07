class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.3.2/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "ea054c97c0dd06b18a34f707626dec7f594529e4e6b526421dca13c76d23b878"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.3.2/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "8f4817c45ab45c1ead0f677bed6a97a12d62ae4fcacae85ae81345d468e84629"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.3.2/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "c53e40a5e491452f2db5977893f66975d459e1d88f7478cd77c994a9263f1eec"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.3.2/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "24e093bf15ba043783387ad59ef772d4b8d3201f27fdd3897ecf93edccee544f"
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
