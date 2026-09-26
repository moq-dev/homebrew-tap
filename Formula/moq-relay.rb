class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.15.7"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "642826f5bf4aaf11d2e2731452d5274570bc3f42fcb2edc529cbf858194a5a18"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "31ba015213e9b8507bb0b3925814f4dae942d6e6b006b612e1148400673b3174"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "1bfbef56d203bbf511bdd4bba48fc3ccd31acae81eced05d0d1371c52af508c1"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
