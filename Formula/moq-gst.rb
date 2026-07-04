class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.2.10"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "69b562b3a26581316b12c854ed6bd143f3b1894bdc22ca4bad99c31ef6f0cb12"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "d38a4d1606dc4a77259259a647b4880d67eeff59735a8463d39d14119378349f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "498a1d60b88e0cfda4ff4c73eea306069c968ac3a42535c07cd686f1845b1d08"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "f8c7e92bff8e9f661d7b258ab9ea4d2a6a1784349fc51e173d1c28b14cf0ee76"
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
