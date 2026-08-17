class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.77.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.77.0/jcode-macos-aarch64.tar.gz"
      sha256 "b0802f0fc7936c9983bc59f9f21a28612fd0983d0e33c7a261522eb94c880f7b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.77.0/jcode-macos-x86_64.tar.gz"
      sha256 "da64a73ac18f05cd3c41da5cf0ebfdbf54767c5cceca0d92967bf097eb9f6fc4"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.77.0/jcode-linux-x86_64.tar.gz"
      sha256 "0428399fad1b45f95574f124c6405be95888155e7d94fa3d34c6ed6c0caac826"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.77.0/jcode-linux-aarch64.tar.gz"
      sha256 "153959dc8b7a8be4f740eb6384b50f599fd7f38a085c3e2e59c0642ce8ed5616"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
