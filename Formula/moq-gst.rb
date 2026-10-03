class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.4.10"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "0d0504f26349eee2feebd11ca2397565fb60aa0013b020888f2cd41a96e35109"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "e77607daf59c98b228b3e78459966259fd36a47e3cf237d4269d4347ad6718a4"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "7f9c4d556e06f87a670c9870fd17214f68c185e07524d1001835878437fe202c"
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
