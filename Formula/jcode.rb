class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.31.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.0/jcode-macos-aarch64.tar.gz"
      sha256 "91dc5b4c184d054894a932d1dd94154eb0c877055a05c3b0481b723d3d04b404"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.0/jcode-macos-x86_64.tar.gz"
      sha256 "3c577d87efb64fcd70797a3b746b7de59361ab59548df4b1f421b9b58fc66987"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.0/jcode-linux-x86_64.tar.gz"
      sha256 "b7916a0b119f0b885d71ed43b7fb8449cd1cd40e4f3c90d7b3788dd14dc2ee0b"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"] unless Dir["libssl.so*", "libcrypto.so*"].empty?
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" ""
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.0/jcode-linux-aarch64.tar.gz"
      sha256 "ced0a2046f559a4ee41ff12944d8eae6e732b3fe032b503a926f948961458c2c"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
