class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.76.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.76.0/jcode-macos-aarch64.tar.gz"
      sha256 "60d91e6568971aec47a9614b4bb7cac06b311922a3a773ebbdbd69d2ac2f3438"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.76.0/jcode-macos-x86_64.tar.gz"
      sha256 "ad4a88fc129099ac6e8f8bef260ae4bfdc0f5dac32a60e9ff09c714e9c3be44f"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.76.0/jcode-linux-x86_64.tar.gz"
      sha256 "b1523c7cf9cbdf740de93f244def7fa84e0a18ef829be34bdf2ef7314b7b1439"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"] unless Dir["libssl.so*", "libcrypto.so*"].empty?
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" "$@"
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.76.0/jcode-linux-aarch64.tar.gz"
      sha256 "605bc2361aeadacb2f1754c5118111181cf14e8b2eca1a42d6a5fe5ecb411a7e"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
