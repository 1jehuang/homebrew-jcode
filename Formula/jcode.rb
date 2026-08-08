class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.71.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.71.1/jcode-macos-aarch64.tar.gz"
      sha256 "c2eb5f3d52cac2c8371f0234ef30ee063201f156372042ec5629c6a787d09552"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.71.1/jcode-macos-x86_64.tar.gz"
      sha256 "76ef6c6c2f6e53942af40d46618827f011090a41960c69076dfcd212fb1eb6f8"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.71.1/jcode-linux-x86_64.tar.gz"
      sha256 "fb2af63f1df5aecc6e9185d1f88be5ec634578d30081af7db68486bc8283f76b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.71.1/jcode-linux-aarch64.tar.gz"
      sha256 "bbd3bcd62cf67f89b7923960cda0fd8cc2129f6347d5e9904b7506e46c884d86"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
