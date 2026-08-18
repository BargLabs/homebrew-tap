class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.3/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "67bdb379b43f93f88eb1aa65dd437d9f67db0453f3597545dce0919a87b86246"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.3/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "44be0d40b612d08fc3c411cb5501e2416bc89d381988f124fa622a2b5d29d861"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.3/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "7b15e8ad18ed91d573f9fd1ad8955fcbbb8272325633413be0b9aaaad143491f"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.3/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "26d9976613ccd7d2b64a07149f3b8762455e7694e2bd6eae913b5a114f0dc600"
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
