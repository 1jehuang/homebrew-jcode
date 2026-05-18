class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.12.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.3/jcode-macos-aarch64.tar.gz"
      sha256 "15f5a9c27162504c4498066e414197b3d13a23e262104bb00bf194664566a678"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.3/jcode-macos-x86_64.tar.gz"
      sha256 "a4eaec33afd894bda8f62e9af14c0b58e8363af9ad89481406f76f8fa12f87d7"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.3/jcode-linux-x86_64.tar.gz"
      sha256 "cfb5a8ea95c3e5298ec6aef138f66e5c5135081a9b97d398b7169b4c27e91329"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.3/jcode-linux-aarch64.tar.gz"
      sha256 "ab1e8f11721e08ec6a20b114caa45f091a963c5cfa2808cf2caacb1700a8b0fd"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
