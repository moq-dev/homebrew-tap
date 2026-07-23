class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.3.1"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "673d9c3cfd18eeb096f52570c880e434eba23d2dd55ccfacd95275286e9458cd"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-x86_64-apple-darwin.tar.gz"
      sha256 "632ebdb7213b22355193f296ebd1d9d2f7a69c660e9d7e3258e5561fac3ba640"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d47f80bc209cf4ad0a223c603760fe0df1dd36fd0ea24c9a9b618a81dd011655"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "c0b8b73b1643d1ddd2071a8f4987ed745236d6862e72e792561392a2ceaee433"
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
