class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.33.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.33.0/jcode-macos-aarch64.tar.gz"
      sha256 "5bfba093cec1b18485ded1a6602ba0fa179d930017e68834904a1b35b32d4c49"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.33.0/jcode-macos-x86_64.tar.gz"
      sha256 "67072f139342b6926212ccb54e26c16579017991820a4ef2cb8b7fd595323831"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.33.0/jcode-linux-x86_64.tar.gz"
      sha256 "636c7b47959b5c2151a90b9aee9cfbd1d92102b78443342ce55c519d1875be39"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.33.0/jcode-linux-aarch64.tar.gz"
      sha256 "a37aede8e960fcb985c0203eb79fd311eb49093df01822dc351a441b388f23ad"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
