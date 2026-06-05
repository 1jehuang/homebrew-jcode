class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.22.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.22.0/jcode-macos-aarch64.tar.gz"
      sha256 "d79947373820fa85bce65d2c53674116579aa3de92b5545a52eee92b12ccc5ae"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.22.0/jcode-macos-x86_64.tar.gz"
      sha256 "d5902f65efcd628c23f0570e5dedf327bc1ecc69a7b0bdc66d8d7ddab3341a2d"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.22.0/jcode-linux-x86_64.tar.gz"
      sha256 "50e568852747835f6c23b830bd438c3483670ef7338bf8f084b6e36237386703"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.22.0/jcode-linux-aarch64.tar.gz"
      sha256 "4fe0a768a712403ab1f5d7d619e72e4f02a3f926a197142d4583437c55f4005a"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
