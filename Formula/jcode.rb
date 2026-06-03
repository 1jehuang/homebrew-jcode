class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.20.0/jcode-macos-aarch64.tar.gz"
      sha256 "61a54adbf5e286c20781b898859ab628f0803036a6658a9d8b2457d6d7a4fcc6"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.20.0/jcode-macos-x86_64.tar.gz"
      sha256 "6abb1acbb82fa03e6f2c1256f802b1bb74b80101fb5797a7a04172fd8f78a814"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.20.0/jcode-linux-x86_64.tar.gz"
      sha256 "3e3233257515b261c1be04a8e64a6dbf2dc5f26113953bc4ccbfe8415b78893d"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.20.0/jcode-linux-aarch64.tar.gz"
      sha256 "18722f85fd6f08ee09bf16ed1f28818e8df64361d98ea15a7c6ccb085844ee2c"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
