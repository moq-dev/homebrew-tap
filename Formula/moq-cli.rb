class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.9.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "a1e2beb20a778af4bd67b4ee021f61a35600c91ba09c5df3c0debbec0722b59c"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "97a207f640aa55f7d2548bc7332f4f641187b82ecacce1289d6191b24286cae5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c8a2ed8b4891461c94152faa7f274f005322236765618295377f0a05f68e61cf"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "35670e3eb713dda07e354561edf85f05a9cae4a8df00cac3f23e57d55f5eb18c"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
