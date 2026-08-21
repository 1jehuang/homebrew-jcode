class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.79.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.79.1/jcode-macos-aarch64.tar.gz"
      sha256 "7e07b9279986b1ac4412ba10217e2cc992a8f821d701dcd31f1636110703e6a8"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.79.1/jcode-macos-x86_64.tar.gz"
      sha256 "c55aee19faf805e946d6109648f0f9f4b651eaf3d31ab8612255eec75c2201ff"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.79.1/jcode-linux-x86_64.tar.gz"
      sha256 "7f0d2f3c8997b38297636d8608098bdb40c94daa3df83cf6e6d3e57a2ea342cd"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"] unless Dir["libssl.so*", "libcrypto.so*"].empty?
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" "$@"
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.79.1/jcode-linux-aarch64.tar.gz"
      sha256 "a37c714f9e815d49bd58555108260239ec6a67c3e009b5909e26b36ea685016d"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
