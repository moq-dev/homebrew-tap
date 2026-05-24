class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.7.25"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ca63bfa49285a5f7be8a8b5b5c136c06b3b2de551db1bf8fb81de09480539d04"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "323fad05b67a76f68afb48726010ec686baebf508904512b1f2c7aa7b0a388ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c9964e54d0e53de2d52e826535644a255bffde5881d727f29ddc6ed6ebe0c3d6"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "942c26a6cb51a59602c2917e04ea9964e6b0cf6042cc37aa4c0b2d9f4a3562e6"
    end
  end

  def install
    bin.install "bin/moq-cli"
  end

  test do
    system bin/"moq-cli", "--help"
  end
end
