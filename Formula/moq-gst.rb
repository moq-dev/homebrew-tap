class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.4.3"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "4d42eb126b839e75872d40ef3a213f563866c4ed683f114107a50a5277e2f3ce"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "a228a0e82ae703306a62b3250d15c7ae7b1359e6277f76a945ec231b9fb7b8b0"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "a8bfabd4f90037579d1084e4933055c1e572b45a7b0070b786779d73d524914c"
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
