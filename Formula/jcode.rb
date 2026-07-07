class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.37.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.37.0/jcode-macos-aarch64.tar.gz"
      sha256 "702355ab3379187045a16c4b1364e68989e7511959ec2fccf406c4317115ccf0"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.37.0/jcode-macos-x86_64.tar.gz"
      sha256 "79bf1564b510d5fa91d953d4c6c8172f7656315380e26d9fa5ccc079389b8855"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.37.0/jcode-linux-x86_64.tar.gz"
      sha256 "3aeed7acd10f43bab65e8bbfc2bf69c99aadf53a0b21896b1e35f25530e534de"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.37.0/jcode-linux-aarch64.tar.gz"
      sha256 "f778996f36b6cb4cf4f4538d47f15db24c4d504ee17e34be8e1871acd4a410f7"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
