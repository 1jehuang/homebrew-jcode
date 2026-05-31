class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.17.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.2/jcode-macos-aarch64.tar.gz"
      sha256 "0a93b2b8e05cdff60be7b2f70ff3b0a91731eb9e412e1132104fe1a31784595e"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.2/jcode-macos-x86_64.tar.gz"
      sha256 "82bada35b5f4fd50172722b9df942723390d193657e95cb9abd988754713976a"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.2/jcode-linux-x86_64.tar.gz"
      sha256 "87480872323284b1b22becaf7733d7a5a818f2dfaddc9a0494a3194c0db27f32"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"]
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" ""
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.2/jcode-linux-aarch64.tar.gz"
      sha256 "5c472d1e3d2a7a034d9756d5d0e6443e0fe107e8a7750f9cb0433b8db9ab54bf"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
