class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.31.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.1/jcode-macos-aarch64.tar.gz"
      sha256 "45ea1bb6431f161ba17e85c90343ea5b3492616f2daf03812937fd6715ac9192"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.1/jcode-macos-x86_64.tar.gz"
      sha256 "e4e0bc4a0a63f082e8eb359b06fe28a176d7f5883989d41e11d04a0c7c3aac2c"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.1/jcode-linux-x86_64.tar.gz"
      sha256 "5265d49898c60c59e31e33f2af5012e63c04b8c4433ccbd6e5c934d973868a61"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.1/jcode-linux-aarch64.tar.gz"
      sha256 "922e779958633368132eb3df3b12f03a267b6428894a07a994ca7d4da6b8cf47"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
