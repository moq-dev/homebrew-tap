class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.3.3"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "f06e8e0abe52f703eebfdf2fe2990c61bb8867c1aa8612b1c0c877ac5c663246"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "90fd10b5852bfecdf91fd4573c96aeac023e23ec00b9f28bfc185e55e8cf16a2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "bf2256b32c8c14fcd07b7d298617df9c5c3ea8e5751a728ddce157b78a8088ee"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "44c50d6a7555208724960225034cde0413c01b120da136b59ea040e20a1d878d"
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
