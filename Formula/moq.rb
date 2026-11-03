class Moq < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.14.11"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0ba84de56267e1be67c3b457428118297c618271c25ca2fbd560c98521a75df3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "fc285d9aaf7e93c4d250f2a0aa0974d837da96053157a27698581160ad444ea8"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f998d25ccd485c67bc5c45fbe6e3ec0f9a3d67b4e04daddb7f89251f145a458"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
