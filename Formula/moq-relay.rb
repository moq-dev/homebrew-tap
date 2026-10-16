class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.17.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "039b3980ed5e198de4ad1aef7a667e2d3da21b99681d128c5cc230c8cf9fc245"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "f64f49c856956ec1ae8566f4f21e902f1757df79db0f4a2611c6dd8614fc4aea"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9153e17022ac50d1b7cdb301973348277072a5fe7ccb0c284677d654f9b5c44e"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
