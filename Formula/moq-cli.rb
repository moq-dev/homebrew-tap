class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.9.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a8603d5f3fba44446bfe9230097e61cd3b8d1968e42b33ca3711cd4f4aae4a47"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9d66a1b0dc0e6a5aaad2e26f3da63d3c670838099fc376e3de7d5f65ccc699e7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "67216e930b81089f5f87b24f3a6b9e78311a7edbd6135814d69d311df01dc325"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f90e13dcedbaabd4703c852ced7be0980a8a3533682848662dddcc9054d718b0"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
