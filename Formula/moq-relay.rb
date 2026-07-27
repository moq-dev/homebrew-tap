class MoqRelay < Formula
  desc "Clusterable relay server for Media over QUIC"
  homepage "https://moq.dev"
  version "0.14.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b8ab8efbe341cada23b47033ae4a996c6d89a736940851363852c9257c4b3dab"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "5debb5101868e7f5a79ad9f24d4d1030a37183506c4d3a3670ae8847b1290689"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "6341f3fb16252e9e549d3edb5c18e0d14b1562b5025349bdc93abe36ba4c3e64"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-relay-v#{version}/moq-relay-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f12fbd4a26ea152fd79296a76347fe3c0975e5ad6f25da1ec6c07d8f092b9829"
    end
  end

  def install
    bin.install "bin/moq-relay"
  end

  test do
    system bin/"moq-relay", "--help"
  end
end
