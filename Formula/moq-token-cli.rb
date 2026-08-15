class MoqTokenCli < Formula
  desc "JWT token generator and validator for moq-relay"
  homepage "https://moq.dev"
  version "0.5.44"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "95ef69fe3c5060f004245f71c704eff32e3c8bb62b1820333ac3668abb3d824d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "0e7055eb5509aed4945b4f8e3dfdaf4520aaf74c11fe63fb9309f9d09ee440ef"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "5062878156e1c4f2525a84ba878e271608e3928f7f164071b742e0df53987628"
    end
  end

  def install
    bin.install "bin/moq-token"
  end

  test do
    system bin/"moq-token", "--help"
  end
end
