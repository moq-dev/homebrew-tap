class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.3.6"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "bda1c87f263f5d6048ef9ab8d52698a83134c51e4a42bada55de65ee1b610c46"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "c88b4d4a192a63c88666bf05c91f0701ceaffcf76b02879930c8df30403f2f52"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "66db8adcc434141573e00aca5a93598a779bcc9eefb67824c037490ed673089d"
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
