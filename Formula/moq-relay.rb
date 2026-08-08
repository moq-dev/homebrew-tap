class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.14.9"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "c5f75f9092d2675b2acbf82d1785a6b901946e43dafbe9dd45c46d2a5dca0927"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "706b2e1a567479d4184bc154870707ee4ce680703aa8986211808c6257f2f56e"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0789471843940e6c0438885242cbfb97dd1167a70a416f00be1bfc254bfb38fd"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
