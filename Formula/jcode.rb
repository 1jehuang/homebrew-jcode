class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.29.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.29.0/jcode-macos-aarch64.tar.gz"
      sha256 "3585cd459ca1da34c9bb8840d563c9d77c3eae21fdaa690c87e1bed5f60d3ae4"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.29.0/jcode-macos-x86_64.tar.gz"
      sha256 "31c95abe557b13fee4d1d9bf49f83831dda6ac79404b8dcf6a49a2c82dfcd595"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.29.0/jcode-linux-x86_64.tar.gz"
      sha256 "2fc2cb645899092d867751fb5502e9241e052a6bdb892cb3b6a1a53f24257767"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.29.0/jcode-linux-aarch64.tar.gz"
      sha256 "54c2cd73e9c91605040a4fded15523c8e0af34a0f88638bbe16f4f961ef9da38"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
