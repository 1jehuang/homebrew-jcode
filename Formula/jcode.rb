class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.58.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.58.0/jcode-macos-aarch64.tar.gz"
      sha256 "6794bc1161e795351acdd9f505b9e64c2fc898dfb52c2045d0295fcaa06a149a"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.58.0/jcode-macos-x86_64.tar.gz"
      sha256 "7a5cfe3e2cfd6887c3893c3da8912f0c3f58885e9efea1c3841897870885a231"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.58.0/jcode-linux-x86_64.tar.gz"
      sha256 "a87572e662b7bd1846c2d2c2ff02fe03864d903993c0123767968a9fcc90f294"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.58.0/jcode-linux-aarch64.tar.gz"
      sha256 "d5d20c7ca5b559c5bd5321ef5247bc990df15fb986010ea9c44a27e2218ad8ff"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
