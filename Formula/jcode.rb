class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.32.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.32.0/jcode-macos-aarch64.tar.gz"
      sha256 "94026520a54b7cc39ac087b90bf70a7663ec7f8b1fccee67b2e89641280af0c5"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.32.0/jcode-macos-x86_64.tar.gz"
      sha256 "707f76e97df56ecdeda2873d52d1eb3056d285edbbffa1bfce9d57e64f174bbd"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.32.0/jcode-linux-x86_64.tar.gz"
      sha256 "b372ccfc5c93fbd424f7343e7ba804992c57086ee8043a1c0bc174101aec5d95"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.32.0/jcode-linux-aarch64.tar.gz"
      sha256 "8728531c291944dcb9507efea1c22aac4442ea745cf7de5b12c36f9af25f79c7"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
