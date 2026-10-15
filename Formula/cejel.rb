class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.5/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "d37b6b7bda7cbbd8e3315ce91cfe72164c1be0fcdc60ce3620ef20bc979c0690"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.5/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "cf530d53c33d7b88b639f0fd99c11599bb364d8da86998365e5db7ccebc28db0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.5/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "5736df760bee7f88ef7a8be3fafd6643939eb95d37d19703e577a70ef2373fe2"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.5/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "342915a7da72cdb5f0c4ddd59962a46cd2affa7e8d5efbf17def2b9d23560c9d"
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
