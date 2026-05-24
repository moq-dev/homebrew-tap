class MoqClock < Formula
  desc "Clock synchronization example for Media over QUIC"
  homepage "https://moq.dev"
  version "0.10.21"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-clock-v#{version}/moq-clock-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f8e17b24ced78005dacb58745d91a53086a8c710f67485343c1d36a89e2f73a3"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-clock-v#{version}/moq-clock-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3a4e96b95f154cb86d54865cabd159a1515cfeac04fadc3cb0889f4e43b74591"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-clock-v#{version}/moq-clock-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b359c03409ec62bf4a1c7dfa73742215ce1d7a022c545c61f69f4c14ee616882"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-clock-v#{version}/moq-clock-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "42a0394bcd368f350fbb7214159849db040f02638dae1bfa900be6d4b3e4a7e3"
    end
  end

  def install
    bin.install "bin/moq-clock"
  end

  test do
    system bin/"moq-clock", "--help"
  end
end
