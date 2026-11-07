class Moq < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.14.14"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "3cddb6907b4dae2c7a1ed68a3c7912b3128c50f748f5e7a7cc4af2cb82a6675a"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d09bd3d45e52586ec514201d1be7f4023837c80a56487016902218a70d5fd830"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c438fa525316e5ba26d5e0d3d5af7c531ae6eb1d28d867cb997f7bfa12faff84"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
