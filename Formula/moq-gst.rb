class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.4.24"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "479f8ae214cf2eb150d7332f65cddc0a2cb5bac80fa365be769b7df4edbc746e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "3a00166d65fa966638aa324b48f90c34a786a1cb2a8ee8cb6cbefa78f35ea865"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "ad5362f356ce8014c2248984988c094a776aaae122d292b4175a01387cf06a55"
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
