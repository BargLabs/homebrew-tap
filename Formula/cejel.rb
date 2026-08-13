class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.1/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "9d0b52fd61e5eec8f15dc2b7a540b6618e4be7a432bc8b8c6a4a826493e77cf8"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.1/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "21b1f6ec706d46e3a548a98692d1eec303d3c9a9c0802734439faa374dba38cb"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.1/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "1f9d63f35d9cf5328fb76353040f4c63e2f4bb300edcbf2434fc164fc0d44f37"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.1/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "5e87d23e9d23ddd75584af23e8c9e56c61bb14999bf3143c5488ef0da9e643c1"
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
