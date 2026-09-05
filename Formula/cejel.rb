class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.6/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "6d42f6027477f1252c53471c16f4371bb5de38b86bcbb56d33f18e3df2ee259a"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.6/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "7b26b075a6e678e34e1006c7b5f7acd555b017b8778026bb0691559ac694def1"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.6/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "0c49e1aa5fadaa0ff56a204be4f02dc70746d274ebcca1fff6f832f992bb103b"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.6/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "8b78d4a3f8f8a8cf3d81663b569bdd9483dbb76559b7caaf30efc09393267326"
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
