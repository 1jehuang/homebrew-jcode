class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.52.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.52.0/jcode-macos-aarch64.tar.gz"
      sha256 "feef7208ce25e7dcd7255b4ff46b781bd6f4f13be584688b8b4cb1eb8c209c91"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.52.0/jcode-macos-x86_64.tar.gz"
      sha256 "c87f58fbe71c549f34f73ff514ce417b2f62088fbac8f1fc75b5c3042adb6e07"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.52.0/jcode-linux-x86_64.tar.gz"
      sha256 "954f0a3d8c8eef0b04ca04280d25716de8d8a9e34cce200e61a26e066600ff3c"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.52.0/jcode-linux-aarch64.tar.gz"
      sha256 "1b93b1c115cfe75e69d047578ccf79dd63dd2ee69cfcdad1927c7f0d2d100ab1"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
