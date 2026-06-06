class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.23.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.23.0/jcode-macos-aarch64.tar.gz"
      sha256 "d8018d6ecb5e9a6b5fe0ba75e82e0a2b205a2f0f5312d4da5a7b66c81697711a"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.23.0/jcode-macos-x86_64.tar.gz"
      sha256 "8fa53039d6b1faa21ee64a521d26c20dff24cd189ea5e0601ea43367d81814c6"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.23.0/jcode-linux-x86_64.tar.gz"
      sha256 "4b22b62ca4cf1591969d8eaab1197adeac442d2f3400414d676dff911ccf15ea"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.23.0/jcode-linux-aarch64.tar.gz"
      sha256 "c1016169098bfd46d738680e098980b1b64a1c363ecf06c89ee64a5369e3ece3"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
