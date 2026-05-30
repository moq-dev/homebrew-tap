class MoqTokenCli < Formula
  desc "JWT token generator and validator for moq-relay"
  homepage "https://moq.dev"
  version "0.5.28"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "ab74fa5abf14fb5d789f2d353bc94552979109ffc4d740a274de3db1b8406367"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "fe30d0d7ba5ba172fdfd68d94a37cf0a8b5fdc43e51f3313896cd3b6525ba315"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "02b4990dcd40489d1e29737e57e5f54d9f6159a03a0b50fd9504255acf618aa8"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d953673fb30c46a5e16b60da346b487473c4b359bace10310e72df7491be8170"
    end
  end

  def install
    bin.install "bin/moq-token-cli"
  end

  test do
    system bin/"moq-token-cli", "--help"
  end
end
