class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.9.11"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "522e9f3dc2e58c09c1905d34515f42f1aade3a622fda919cbb4ce4ebe8d81752"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "1961f2684ff7c6eda375dc89cda38562d0afabaec7371e9af3612256a6deb79e"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3ae76766bff36c68fb240277f4b6e05c8762018d9f6aba5b434340960c20e4d6"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
