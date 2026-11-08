class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.4.25"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "060952973fb41582536eb37284803f11407fff3c32d6b4dddc9801f3839b3fb5"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "b11b57073094737c4d8b2d43d739c362fc3f1f17ce593c71f8c656865d63b498"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "6faad8ab0805ce4bce3d4d326ffe8bb75142b841236e8a956ed5c04f042abf17"
    end
  end

  def install
    plugin = OS.mac? ? "libgstmoq.dylib" : "libgstmoq.so"
    (lib/"gstreamer-1.0").install "lib/gstreamer-1.0/#{plugin}"
  end

  def caveats
    <<~EOS
      The moq GStreamer plugin is installed at:
        #{opt_lib}/gstreamer-1.0/libgstmoq.#{OS.mac? ? "dylib" : "so"}

      For GStreamer to discover it, add this directory to GST_PLUGIN_PATH_1_0:
        export GST_PLUGIN_PATH_1_0="#{opt_lib}/gstreamer-1.0:$GST_PLUGIN_PATH_1_0"

      Then verify with:
        gst-inspect-1.0 moq
    EOS
  end

  # gst-inspect-1.0 hangs at startup inside the test sandbox on a headless Mac, even for
  # --version, so check the plugin links GStreamer rather than loading it. The release
  # build loads it into GStreamer outside the sandbox.
  test do
    plugin = lib/"gstreamer-1.0"/(OS.mac? ? "libgstmoq.dylib" : "libgstmoq.so")
    assert_predicate plugin, :exist?
    linked = plugin.dynamically_linked_libraries.map { |library| File.basename(library) }
    assert linked.any? { |library| library.start_with?("libgstreamer-1.0.") }, linked.join(", ")
  end
end
