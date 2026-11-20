class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.12/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "737506af66f04579e29bbcf27f8fc7a94890e20c0404cc686092014cc8bba163"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.12/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "48af457e20f57e043c56520596c0ee585acf58c2c3a3d9f4c1d1e2baba8e71a9"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.12/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "986387eb15e5f63524b18073927b91991797f903b677822cbb8cfb61ca0b27a7"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.12/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "07b5255e1cec317fd5d2246eaffcfd48fe9db67964491ce64f446989f42fc0ed"
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
