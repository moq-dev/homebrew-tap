class MoqTokenCli < Formula
  desc "JWT token generator and validator for moq-relay"
  homepage "https://moq.dev"
  version "0.5.32"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ffb1ec10c1a37d627d3c476862d7852b207d28020cfb6c77f9080f33a5d8c8ab"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "20c204cbac05e8fc2f2e941a0e0a0c74a815fb47a8caeb2f8354be2c49ad2398"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "8064aed5ecc0bf7694c22abde997fe70d23db956cf9387c7799a760c6412e6a9"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3df927fefc46f3c024a14061ed028fc058b76c74cdf94a70456597750975ef11"
    end
  end

  def install
    bin.install "bin/moq-token-cli"
  end

  test do
    system bin/"moq-token-cli", "--help"
  end
end
