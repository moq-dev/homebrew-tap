class Moq < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.12.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b21eaae551295d113d62bd5dcaa52f3d738d2d36a0808aac47354cc2b1d439a7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0b44ff8025edc4d5a67bce7e8c09d4b7e5cc48f454877503a04efb83de5fae34"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "82481de02820a69821099b37911ae0efc298c676fb1f2310399a6abe08c2f1d1"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
