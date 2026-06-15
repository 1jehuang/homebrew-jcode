class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.28.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.28.0/jcode-macos-aarch64.tar.gz"
      sha256 "6b67416c5afd5c48c9015a004d5de5070539f15b29f326cda3995c309490f52e"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.28.0/jcode-macos-x86_64.tar.gz"
      sha256 "75c22dd61544512408760d41ce92f067fd7ba6233e8fb4f1ed6dbdc4b283f101"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.28.0/jcode-linux-x86_64.tar.gz"
      sha256 "10c869b833ff3bfaaf5404f6dc589868307fb8d93f9ccee93f49531d21dd4166"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.28.0/jcode-linux-aarch64.tar.gz"
      sha256 "08e7a22e3cfb9f05262a790964575b7d5c639b30ccbada27cd1dee18ce16edf6"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
