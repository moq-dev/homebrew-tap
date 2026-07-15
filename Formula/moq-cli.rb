class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.8.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "13cb3d632cf20571cdad0f6f51ea25244d2f1b403a80a498879ead7a6d19739c"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "9999473e6094115910df441d72bb892bd59d16292cb3bfab6a4c4b74307fca08"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "cff2cd395b9c7962d8047ee84c4cf192bad69208e4420bdf1ab908ecbd03dd2d"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "968b6eec24c7371fab55a709a97e280e83ac1ea4572b7e166b357d9fe2cc7156"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
