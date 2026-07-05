class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.36.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.36.0/jcode-macos-aarch64.tar.gz"
      sha256 "7772def7ef24325a7f68cb29cfed42ac16a75a2bd520d8e6bbc9927af38f2b84"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.36.0/jcode-macos-x86_64.tar.gz"
      sha256 "b6b51ba3b07eb93424574c7d72401b05fedbb361b429b83a8ab377bbb3de40d5"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.36.0/jcode-linux-x86_64.tar.gz"
      sha256 "8e026c3867ed79049430a39fc79663acfbbb6778d3ca9dd7414acfb309717abf"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.36.0/jcode-linux-aarch64.tar.gz"
      sha256 "49669b848f96de666a2bf846e6bb9d7c2ec8ce1a69a186d6ffb7c9141a36d996"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
