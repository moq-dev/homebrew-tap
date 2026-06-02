class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.7.29"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b9f175e40c2b08faabd50d49243859e303e2b260f938c57f7f2604f9e17f59f4"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b7a594c09211857887ac75c9cf9d00b023579e55972ee5084dd2a05ad12edd61"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "9d317c1db70dc253d03d3221002ba65f14d9432b44a7b3d7c4b6c773a945086e"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "bad43ce109e2f20db141b7ab0860c3975e464774078a0d44510bc77248d644a9"
    end
  end

  def install
    bin.install "bin/moq-cli"
  end

  test do
    system bin/"moq-cli", "--help"
  end
end
