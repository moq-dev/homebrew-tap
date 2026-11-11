class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.17.16"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "9504d35aadc5a72d5874428525ee20dec6f3bb89fa4897be05f375cb62038dd3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5f9ebe53d05fa1e2754566d632e3e8919e5d679aca6c8de755c172451dbaef30"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "8bc38fe60a8e5543729a42727eb143746526f7c3f1e4361e4c8661e9a8004074"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
