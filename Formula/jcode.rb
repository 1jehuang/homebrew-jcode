class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.25.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.25.0/jcode-macos-aarch64.tar.gz"
      sha256 "e3cdd231a25d2dc663011e03c815604e98d2c8b0af5c6cadef677a37adef18bd"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.25.0/jcode-macos-x86_64.tar.gz"
      sha256 "a41701795b0c5f14ef7ede5677e5be98f5ab9897a9f2ecb7d7c6efc7d27c7531"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.25.0/jcode-linux-x86_64.tar.gz"
      sha256 "e48f175e49faed75e614d7d14ce23a10bd92d4bff58099e2aaeb0519adac078f"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.25.0/jcode-linux-aarch64.tar.gz"
      sha256 "55fe1d81b944e4bca6718140e56fa91b277d1be042530399b0446479e7651336"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
