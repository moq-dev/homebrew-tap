class MoqToken < Formula
  desc "JWT token generator and validator for moq-relay"
  homepage "https://moq.dev"
  version "0.5.48"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8b73eed30d824e1426b6ba0eba46ee664df99d01402ff8e26eff84db156fe596"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "384fd8ce5562816a4989346691b321ea1a6101e17e692d9de5ed91b9625d0f60"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d86d2c9149b443820dbdcc105115aee102c02c85fd8005ed1aa26f9da00a8c70"
    end
  end

  def install
    bin.install "bin/moq-token"
  end

  test do
    system bin/"moq-token", "--help"
  end
end
