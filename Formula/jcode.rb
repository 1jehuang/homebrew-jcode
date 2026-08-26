class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.81.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.0/jcode-macos-aarch64.tar.gz"
      sha256 "9f2c28c72dc18b2d02d570a0dfdfd06a348f299268385cd5ea003225574132c3"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.0/jcode-macos-x86_64.tar.gz"
      sha256 "984f673bf3574d057963f8eb4ce9e90d270fba46bb3ba676c90ccf83a8ef4bbd"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.0/jcode-linux-x86_64.tar.gz"
      sha256 "5011801487a50251f38321cc971512928127b5fa322b371346c75c73e963a049"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.0/jcode-linux-aarch64.tar.gz"
      sha256 "43db830d1b06359ea5aea0d5975976aa4dbf0c2f23af1f43b5c6e4eb829ac0d9"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
