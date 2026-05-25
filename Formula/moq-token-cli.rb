class MoqTokenCli < Formula
  desc "JWT token generator and validator for moq-relay"
  homepage "https://moq.dev"
  version "0.5.27"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "06415a7f34cceae578f365210def4bfd0f1cf7bf3f5050db641d0a2625631837"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "8884bcf623df4d7b22f568296427812ff23bf6296e9f6162425b9d52fc6e4430"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a816b58f77971eec736f5ff5b93d4902b0fdbf5a2a25b9b9a5573206c86f6a45"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "e374e79522e0d1af1d5e5e032db1464fb45c230ab328bc1471cdcd8e4df61482"
    end
  end

  def install
    bin.install "bin/moq-token-cli"
  end

  test do
    system bin/"moq-token-cli", "--help"
  end
end
