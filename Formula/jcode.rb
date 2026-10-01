class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.90.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.90.0/jcode-macos-aarch64.tar.gz"
      sha256 "3453ef4a13904c1e524cacc02fe1115cb843d3a188e13604bc0486d2a450f1cb"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.90.0/jcode-macos-x86_64.tar.gz"
      sha256 "13f077f347035c7978ad8c01616b2c445ab78b5ffcb3b60e3caac424c14bafc2"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.90.0/jcode-linux-x86_64.tar.gz"
      sha256 "b963b7cd53ec0dc39c805c4549e9752ab194d4e1bd338b536d587c9bf8851516"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.90.0/jcode-linux-aarch64.tar.gz"
      sha256 "8b44b717e1085950cf1fc5b1a5005e087c9e38c1e0293b6009fee1ab0b2c451f"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
