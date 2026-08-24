class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.80.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.80.0/jcode-macos-aarch64.tar.gz"
      sha256 "f7532988337c0bdee303f965c67af075842a435dec0500723c8af9c70ee692e3"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.80.0/jcode-macos-x86_64.tar.gz"
      sha256 "ad3d9ea357412d6efa5b39cf9800c6d26f2aaa515a9c0b3518e4dc3b99bc1cd3"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.80.0/jcode-linux-x86_64.tar.gz"
      sha256 "20d0cbdff2a8a80b8ea59e14f4b0749e279377c3845a937a36df654a8db90419"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.80.0/jcode-linux-aarch64.tar.gz"
      sha256 "37914e39d3b56ea956fc9accd915fd074b29af5511f540a1375d3bf353d4051b"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
