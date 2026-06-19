class MoqTokenCli < Formula
  desc "JWT token generator and validator for moq-relay"
  homepage "https://moq.dev"
  version "0.5.31"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "5d7741f66f659749ff8b984b2af2a93807506db7c26627430ad473a2b969c5b5"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "caca351b2b88c7a229359cc961ac3c8d56bc46849365a99a297cf3a51e27ffa5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "4adf532361476c8631e525f7382aee9a26edc7a0417bb026384bc3afecccca52"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d3e0e69467fd86d189265c033f402b4f6182d9ee80b6ae6e29a595cbec153128"
    end
  end

  def install
    bin.install "bin/moq-token-cli"
  end

  test do
    system bin/"moq-token-cli", "--help"
  end
end
