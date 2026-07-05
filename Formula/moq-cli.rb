class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.8.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "11fe06cf18d33d702e086f669c317ccdf98d502908a207023065d7b59a8afdaa"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "dd0a6c53c63344d7ed1eeb6dd8f732d046dc1ec00ac3870d76e073ace620e5ed"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "48d2116f55cc967e5f966d5cf5983dc604e8dc7427954d06d6ab84a05c2286e3"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "3130bb9f92cb71b25ce7fcdfe1676279243cfcde17cc10d7db769cbccffce80c"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
