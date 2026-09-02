class MoqCli < Formula
  desc "CLI for publishing and subscribing to Media over QUIC broadcasts"
  homepage "https://moq.dev"
  version "0.10.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "748161695e0f802c68abfc08f375b501b96cea620a803a2d2626460bb2d649c2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c4fb5e015a1944f3da0244521d9199a3557dc3d8a79265c14ff0640f50b9db03"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-cli-v#{version}/moq-cli-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "2f00d5375eb10a6c77a72647e8a092c10bbe45e72262c1103db31e9e67e4780f"
    end
  end

  def install
    bin.install "bin/moq"
  end

  test do
    system bin/"moq", "--help"
  end
end
