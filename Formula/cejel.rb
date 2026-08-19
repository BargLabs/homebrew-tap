class Cejel < Formula
  desc "Offline engineering-trust certificate for codebases"
  homepage "https://cejel.dev"
  license "AGPL-3.0-only"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.4/cejel-Darwin-arm64",
          using: :nounzip
      sha256 "26fb7a3bd10a959020b52369966d558616b8a741c6e9cbf8b943bc3f138f4826"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.4/cejel-Darwin-x86_64",
          using: :nounzip
      sha256 "08469257e2dee3be9f06d3e001d9516170fbe3c54a7c0019c6b9828015f924ab"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.4/cejel-Linux-aarch64",
          using: :nounzip
      sha256 "c430373da5379f98190873cf56a2ca3debd3c11e7736eed133f736f51839f93e"
    else
      url "https://github.com/BargLabs/cejel/releases/download/v0.4.4/cejel-Linux-x86_64",
          using: :nounzip
      sha256 "1960bdfbd51dfd768055d2f8822b063e1ac8e20ca10c38b17a0733bdc877316e"
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
