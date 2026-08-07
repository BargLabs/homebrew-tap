class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.3.1/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "0dbaea56a35a3a55ed6f9274cdcad200f9114678fce34b67935faf9099bb5a14"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.3.1/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "6e100b1fe918da7ea89fcdcf5a754045fde16e79c585bf2f8ffd8745ea24afe2"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.3.1/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "91c85ed7ee3af72285930508e151ee0b6c3e13f38659b8ce5ab8679b2b4d075c"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.3.1/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "c068d89b52b15e5fba045b6eb460cda7ded8c97a7823344831b1be95c48c2390"
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
