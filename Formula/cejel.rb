class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.5/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "906f5e7ee279b32fe263182e9f73be17fed51fe8c42740af0eb33392e59986ef"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.5/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "36a6c939d4f90b5c994d8dcd80185ca293c5da0d816b3ca0ae724384d79fb135"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.5/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "f9a873c7d052ccf2183798269c4539f942a5e941f1b9a8c5c3cb2a3aa051b522"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.5/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "d69ee267e5046d537af1cc5fdc01ff53b1e4e2dbc33679b29b2401a5caa4177f"
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
