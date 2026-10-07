class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.1/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "7cc80a42c199d0d0ccdbedc20b3afdc3744375c7e1e2039c109eabda2cb8b1e5"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.1/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "6a842cb97f9d2f04b0b0bf3b1586e807aef57f37d7661c9fc90ba9da44db1884"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.1/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "610981915967d4961ce7702dcae7038ac8eace905a17a59267ba24fc3a5bbb74"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.6.1/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "428cdda40e1ac41371be67365a0ab7102925a218defafbf4b3f4b68d97bb6994"
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
