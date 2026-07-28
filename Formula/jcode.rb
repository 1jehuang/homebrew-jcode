class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.61.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.61.1/jcode-macos-aarch64.tar.gz"
      sha256 "ce92324ebdc963b4a49592cf86104e9bcb65fbcd86b7bb047b317c503981c598"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.61.1/jcode-macos-x86_64.tar.gz"
      sha256 "a558f829e91cc1bc26611b02ff14798e78a5aa521afe3c0d255a66cfd1aacab5"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.61.1/jcode-linux-x86_64.tar.gz"
      sha256 "0ccaa2338887b18c3da76b9f3cd84e7d3a762bda691e71df83440190f4825da0"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.61.1/jcode-linux-aarch64.tar.gz"
      sha256 "a78e1a8bbf14d4f0840a0a051e5af3c70c67e5d8c66a7839403b8b0521d8736d"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
