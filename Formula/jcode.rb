class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.66.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.66.0/jcode-macos-aarch64.tar.gz"
      sha256 "2640f0411db44aadb4819dc9450eec4a0121421a6b8efefa137bb8dcd843ba3d"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.66.0/jcode-macos-x86_64.tar.gz"
      sha256 "3f39170f1d643486c80db71eaabfaa94244e7c8ee692566c7e0fdfb6431da758"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.66.0/jcode-linux-x86_64.tar.gz"
      sha256 "3919e93f9b99d608b6b4d1f2dde4a50ed4585d0cc48b359bfc984c99b651658a"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.66.0/jcode-linux-aarch64.tar.gz"
      sha256 "10b82e78429c2d9f34790ad4c22a9aff3569dc115bebde27b1160fd11ef66639"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
