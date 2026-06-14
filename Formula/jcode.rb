class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.27.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.27.0/jcode-macos-aarch64.tar.gz"
      sha256 "247e6ba34f6aa5da8738eb025bc59144a43de82fb973f77f9a40962c131b6265"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.27.0/jcode-macos-x86_64.tar.gz"
      sha256 "aca243619eb2cf01886c1b63eeafc186f1f009757b769e9e9af4a5d777e15568"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.27.0/jcode-linux-x86_64.tar.gz"
      sha256 "2a5318f1b6e6259262d4b654124c5511da412d4d8b271997a532d9e0fa0dbab2"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.27.0/jcode-linux-aarch64.tar.gz"
      sha256 "c55049815e1e619418ea8742f522c3205e7959e96ba8bacdf12a8d18fe2820be"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
