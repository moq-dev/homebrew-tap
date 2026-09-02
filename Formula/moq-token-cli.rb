class MoqTokenCli < Formula
  desc "JWT token generator and validator for moq-relay"
  homepage "https://moq.dev"
  version "0.5.46"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "00379a60f4a0cff5a4d1161f2a5ebec8311cfc63da39331e9355be30e7859c78"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "ed591843efba767c8e09c359c14ee9be1f211ee18220be07afc2d092facf880c"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-token-cli-v#{version}/moq-token-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "238f3e93cc938f2baa0f4d9145119bb569b3257145a471ddc8679d440b0d898b"
    end
  end

  def install
    bin.install "bin/moq-token"
  end

  test do
    system bin/"moq-token", "--help"
  end
end
