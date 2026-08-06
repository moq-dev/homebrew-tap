class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.14.8"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f6eb3496da386251836925b17b6bc7ce609b8bbcf34ecae96e93c2a37a41d811"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "4ce3ade4781b3740b0962f9bc1ee2533953cda642918ab56c945ea362e8b55de"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "03158fcb47836ba0faad0c8bd1f7d99a2e70e55259ae7387083c9432c94b3b97"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "4db87bbb395e581fa350e6f65524581d7c2a16b2e564941e6db2eb0a6333c023"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
