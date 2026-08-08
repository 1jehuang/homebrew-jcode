class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.72.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.72.0/jcode-macos-aarch64.tar.gz"
      sha256 "cc327ee7968232dabc205b1831f3b1dfe1c1914227f3c466332c0f2004bb6642"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.72.0/jcode-macos-x86_64.tar.gz"
      sha256 "2370765adf1d2806ab1965daa09408bd60b1ad007a8c90dad8694b8dc425eadb"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.72.0/jcode-linux-x86_64.tar.gz"
      sha256 "60fcbfab6c92e63e32d8a7ff757b5696479b338de455e4eb17180cfc927743ed"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.72.0/jcode-linux-aarch64.tar.gz"
      sha256 "e4cbeb84d5c5f99c32c1497757dda1047042c1ae34828b7fa46ac7fb2218bf47"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
