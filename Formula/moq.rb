class Moq < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.14.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "09f9e60b8f57373fae623b6be112340b9cd69cfc577b694e5634cdb27fce4769"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "716432daa0eaafbbc81f6deaf63b35face7d18e56366dcd69c9554d8d5ae2f5f"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c3222500439b70a07f390910592228c5a1c5f3219aa453c0aa77ce6955315b86"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
