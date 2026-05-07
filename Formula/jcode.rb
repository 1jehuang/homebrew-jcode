class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.0/jcode-macos-aarch64.tar.gz"
      sha256 "6e0d886748cd499ab2ec3b5cc8d78a882e336397efa5fc2a72d0b4efb78e1a11"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.0/jcode-macos-x86_64.tar.gz"
      sha256 "a6f2f842e70d3a1a5003a139c15925ac24ab2cc53d835c47198d5b1f4879d2bf"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.0/jcode-linux-x86_64.tar.gz"
      sha256 "cc7fef26c348124af40db1793481b46945842e20a7b6c684fc66bea7b2524f0b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.0/jcode-linux-aarch64.tar.gz"
      sha256 "8b96fd173c6529b1c6c992d3045f3d2d0c40b873f47e4e0c6e5b60d197b38af4"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
