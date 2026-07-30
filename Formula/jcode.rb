class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.62.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.62.1/jcode-macos-aarch64.tar.gz"
      sha256 "23e07c00cb37a747047aaf85cf3306ef8018336f887042b8d9365c4160d53b38"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.62.1/jcode-macos-x86_64.tar.gz"
      sha256 "732c9aba459deb07e4589110e7605619cc0a85f1ebfa67257d9b563b20493789"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.62.1/jcode-linux-x86_64.tar.gz"
      sha256 "2f837c638be1fb6a366f9a663c3322216d26e916288de6d8f6e646037696fed9"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.62.1/jcode-linux-aarch64.tar.gz"
      sha256 "3f0884003df73267038adc4ec0be3460ecdd5a0b97947c69133356485aa01df4"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
