class MoqGst < Formula
  desc "GStreamer plugin for publishing and subscribing to Media over QUIC"
  homepage "https://moq.dev"
  version "0.4.0"
  license any_of: ["MIT", "Apache-2.0"]

  depends_on "gstreamer"

  on_macos do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-apple-darwin.tar.gz"
      sha256 "b409c29cfbc66f798d249abf38fd32a3fd11b2f0703192934d0799d21abb8aa3"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "da8ec2aecbffc03d5121055a2df36a20f19dab82e05cf1c158819043e8fe432d"
    end
    on_intel do
      url "https://github.com/moq-dev/moq/releases/download/moq-gst-v#{version}/moq-gst-v#{version}-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "9368f16d4f60d7a66b312825eafa8a49db204b565786650dd2c74890b60f3ca8"
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
