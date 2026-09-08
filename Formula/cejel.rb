class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.8/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "1a9fe86143b736bf99ad4cad84d373791b147987d2baf0b0b61fde98824811c4"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.8/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "7adcfad9de1a36b7fbb1ce7445b836645af223666e6c3d2eb42435628732f0d0"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.8/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "ad8d633287431bd7fd0849060283e19aae4c2366fd1c186c14d354956a761308"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.8/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "c085efcc9f326ad57e33c007c01197fb8af5083d9c1e9044fe763d637a316077"
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
