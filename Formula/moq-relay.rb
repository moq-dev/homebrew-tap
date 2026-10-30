class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.17.10"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "dfe7b46cacd585627c047eacf5a67eb33445693aa4fec85bd10fc6cfefe6720e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d62787447ced9e97191a7dfd16595e31bdb233ab4e79797afde0eb9a70e1323a"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ce1c43269217f1e99045a643c6099d6be9454409cd0f59549a02062a64c39c25"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
