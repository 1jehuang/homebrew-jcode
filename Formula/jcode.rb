class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.87.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.87.0/jcode-macos-aarch64.tar.gz"
      sha256 "379b02ff47f6b984cf8e6dfe7969a2c618c2858538bfdc2b65643ed4d51295b5"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.87.0/jcode-macos-x86_64.tar.gz"
      sha256 "c5c91c81c1debb87474f94601eedb5adbfd8d393574a196b555b0f535b1d3d19"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.87.0/jcode-linux-x86_64.tar.gz"
      sha256 "5f360f0b09db84de678d64da854d62ee5d530d734fc7440f68e55c6bb0dbb02e"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.87.0/jcode-linux-aarch64.tar.gz"
      sha256 "1893f8960d0a683421ccf106e270b36b5cc71217e1d84a13293017bec7cf7462"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
