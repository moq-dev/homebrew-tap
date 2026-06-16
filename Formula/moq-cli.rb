class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.7.32"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3dec4ad9c7e905e6e7737ec5704d1206f1e9dd3052fbaef3e9ab35093d346caf"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4efa3bcec2f78de5feb62b7ef9657a59c26e682a59896819a60cbeb416435472"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "92af629998a4ad7970b2ab3a0d781986e4469aaff4677446232a19e4444861d1"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c173ebe769b932786ca060e0bc9d7daa26f72fc96c7e6aeffc577ff91bc0d7b7"
    end
  end

  def install
    bin.install "bin/moq-cli"
  end

  test do
    system bin/"moq-cli", "--help"
  end
end
