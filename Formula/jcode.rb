class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.65.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.65.0/jcode-macos-aarch64.tar.gz"
      sha256 "e46c3368f5e2b3c456cb8174b2e53024cc25941b2a012c8e9bc80fbbddb8528f"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.65.0/jcode-macos-x86_64.tar.gz"
      sha256 "ab41fea7408cc4d6756907da7e30b5eaabbd16d34595d2ae5ecdc9981a0d7763"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.65.0/jcode-linux-x86_64.tar.gz"
      sha256 "f3932156923ad0c61a6e4aa26c3f539c4647d9c0f6a695834cf3f7d856455808"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.65.0/jcode-linux-aarch64.tar.gz"
      sha256 "c74cb078736334323b50b0da565f428001d8cc22e58b161e246d3f9bed67626a"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
