class MoqTokenCli < Formula
  desc "JWT token generator and validator for moq-relay"
  homepage "https://moq.dev"
  version "0.5.30"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "fb7094776990c9e7d6eb4fe9e8b2524989e7ac21a7b28c0b6c47bcf7504f4f7a"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d61024bf9a2ed472543da2d31d9e0166a119fe32087e661c6d62ed4b01be950d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d2e32728150e289131064bd76e164469dea7778a3b2cc19a0b697c4b814e2afa"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b246be5a942b2de8a9fbf20025e81edb6efd67a4830e9c714f33b3370ae98d90"
    end
  end

  def install
    bin.install "bin/moq-token-cli"
  end

  test do
    system bin/"moq-token-cli", "--help"
  end
end
