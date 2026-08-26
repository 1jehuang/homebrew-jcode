class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.81.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.1/jcode-macos-aarch64.tar.gz"
      sha256 "d7fb8c2389106e6a3c106881f821082a5411bc0f68b3e64a0088ea4daaae7047"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.1/jcode-macos-x86_64.tar.gz"
      sha256 "c5a6a223f60dbc962ec61471b74f2fa7bf61a62e915e08883633320a3b28738d"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.1/jcode-linux-x86_64.tar.gz"
      sha256 "ddfd6b8f7d6fe15284d78785eda1130a6e2ecd8d3352f20628822a1eb7aa2549"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.1/jcode-linux-aarch64.tar.gz"
      sha256 "89712dd36de31905a23850f4af0af18081bcf26088c7c359c53d9dbdec897919"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
