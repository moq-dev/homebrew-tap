class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.17.13"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f4aa9bf08b9bf065cd4078f98778f6f96bab0ae911fdcb2c251a15e4a95fae37"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5738ac179d44eee01a4ad3fbe00e619462786f4d72808a7dbc516227dedac918"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "372801c107babd5c676450fa57e588c25a37f8eb89d816bf202fde6dee6718f6"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
