class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.13.5"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "d9dfa9ff28cfe803303c59dffb227ea1fa7445854b8de8205414f3110e64d610"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "b63d8b410f04694152846a8aa9655e4ef6b86b20adb680d9ec789be91e39d288"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "5ec28adfcf1157778ebf1df2aee6e6f7b7df96ac7ac29934cdd7f2d5ec5fd198"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "97e43fda033ea25dbadf8dc97021f408b3ae6f977b679dcaac9b3f37f82354f2"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
