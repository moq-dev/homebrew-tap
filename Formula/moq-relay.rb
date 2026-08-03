class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.14.6"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0367f2633a119d9122b24d0132b861ddc60c114744cddee631f4542fe96f4a67"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "874d60bdb72053d387c3a23268c34ba9fd5b24e1c50b98f78429942aaf767483"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "872f3483ccdc3655abf4a7c841501dbb4b065668cd27fb2a0da10d55907ad9e6"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "0693ba0ffb54343a5f2e79196f26953cee30909c011576e345312161624bc3b7"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
