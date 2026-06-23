class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.7.34"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "da1850fd047d6d86470223675de84826e21b45fdbbcf60ec8006ae47eef4d320"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "c645b28697a0ea3a9ada449bdf38050a21a6aa9cbbf4a073f49cb1ed1a84c293"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "29760cee52a6a36385985ce7f624b31e26e223d123c8667e733081575bc41bba"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3b59cc2124505415b3340bc3c7563963c1160ad15a9e0aa9f345a716314aed25"
    end
  end

  def install
    bin.install "bin/moq-cli"
  end

  test do
    system bin/"moq-cli", "--help"
  end
end
