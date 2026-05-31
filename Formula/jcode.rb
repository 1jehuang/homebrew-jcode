class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.0/jcode-macos-aarch64.tar.gz"
      sha256 "ff24dc9ce0f68250a4f043151a166626a92377bc7b1741cd529a6e307fe4585c"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.0/jcode-macos-x86_64.tar.gz"
      sha256 "fcef4f2a38f4a234ba60a3da6453ed19cfc9559eb1b741cd86e481dc716b5f6a"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.0/jcode-linux-x86_64.tar.gz"
      sha256 "b211f2103e92c9d0ac318180faf657ca60fc66c652b0da955d00ce4214333c11"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.0/jcode-linux-aarch64.tar.gz"
      sha256 "95aae9671aa41d9f626bd6d0845f58441e9c6393058a0a09d52e84d6ef28c76c"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
