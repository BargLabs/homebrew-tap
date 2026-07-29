class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  version "0.2.2"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.2.2/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "130a2e79b316aeefb99a3b787270fd2dcfeab896e7def6d53402a5202f8f54cf"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.2.2/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "3fd207815d7358e89d43c2003ed9400a834bbac8d861ba6ebe8b69fd05526b09"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.2.2/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "be291ab013e9e2eee4bb0041c91bb7e21564275714812331ecbf92a67593ae02"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.2.2/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "5243678332deeb463bbab94716455142710a7b597e084503bfa4de6c48345d06"
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
