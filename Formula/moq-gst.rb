class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.2.12"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bef57746729ccaddc7f6d63933af700bdbb23e8e7b90463b3e1d81be85af15a4"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "3aef6ff9693f0435ef52f667e85c6138e86a8e228c023cd16d78501632268991"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c146b3aad512c7cfb487ac635d2a78d5ad283c3a77d8ad3ee94515b9d28e74fe"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "d08881440799615366b2ba9aa13e58ee2cf43feff6dd4cc98c8dad6858768e8a"
    end
  end

  def install
    lib.install Dir["lib/libgstmoq.*"]
  end

  def caveats
    <<~EOS
      The moq GStreamer plugin is installed at:
        #{opt_lib}/libgstmoq.#{OS.mac? ? "dylib" : "so"}

      For GStreamer to discover it, add this prefix to GST_PLUGIN_PATH:
        export GST_PLUGIN_PATH="#{opt_lib}:$GST_PLUGIN_PATH"

      Then verify with:
        gst-inspect-1.0 moq
    EOS
  end

  test do
    plugin = OS.mac? ? "libgstmoq.dylib" : "libgstmoq.so"
    assert_predicate lib/plugin, :exist?
    ENV["GST_PLUGIN_PATH"] = lib
    system Formula["gstreamer"].opt_bin/"gst-inspect-1.0", "moq"
  end
end
