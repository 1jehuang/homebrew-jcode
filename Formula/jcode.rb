class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.26.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.26.0/jcode-macos-aarch64.tar.gz"
      sha256 "ada7f551706a351258fcccf67713592bd34927b1a8daf4e8494be6c584ea7fa3"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.26.0/jcode-macos-x86_64.tar.gz"
      sha256 "35ccf0daf69a8be195d5c556bea16367690397a1bc10ffe7b567cc17684223ed"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.26.0/jcode-linux-x86_64.tar.gz"
      sha256 "1e214aa8ed53f8d704b23353a639fb14a7d2bb0724bfefc6e4840eda65474df6"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.26.0/jcode-linux-aarch64.tar.gz"
      sha256 "3c1f3de1700a59cf7f32659aea8a5185c0e845830e1ff3de2414ac6adb6c2816"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
