class MoqTokenCli < Formula
  desc "JWT token generator and validator for moq-relay"
  homepage "https://moq.dev"
  version "0.5.47"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "8f7aa7de4d66e42a4361f917c95d8562a200fe13c08b227908298a30c600ee6c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0d405a7c0badf825bf329a15001e642f89decf718b8a97e21805f289f111d29e"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "b838d1d5979bcc71bfb4ffaa469b10213477d98239cb703c9c0871cdd54a978d"
    end
  end

  def install
    bin.install "bin/moq-token"
  end

  test do
    system bin/"moq-token", "--help"
  end
end
