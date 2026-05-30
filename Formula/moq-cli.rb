class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.7.28"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "eff8c63eceb9d5358f9d87be54e251669406ca7b638ff8d1da4b2bc06e767c22"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "149902d34c81a946799f7304f3498aba19d35e1564fa5f70da68921705a482ca"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f513465e6e7e062becd5fcb8eb3aa35572af22d59211e1d9d082ee590cf21a9b"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "21b93008f1f5e44cdcd3c0cca41caa97be44ef674ff880adf9d97d626a9c860b"
    end
  end

  def install
    bin.install "bin/moq-cli"
  end

  test do
    system bin/"moq-cli", "--help"
  end
end
