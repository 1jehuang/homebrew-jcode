class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.68.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.68.0/jcode-macos-aarch64.tar.gz"
      sha256 "cfe5047b121154604e634ba2d0e6ec6bd825fed952b4203c4359882eb370b583"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.68.0/jcode-macos-x86_64.tar.gz"
      sha256 "5721c049cd19555778e37d4f2e0ec759f33ffb426b466c2ef80801d2cb6b27bb"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.68.0/jcode-linux-x86_64.tar.gz"
      sha256 "d0bbd8c66b564bd318ace6d82ed2f26438ee0a9c1f6a091f52e3bbc5e24296a8"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.68.0/jcode-linux-aarch64.tar.gz"
      sha256 "ed459c7fe33b00197f8fd6913a8de1d5aab80878e132d90ffc734e2ea3b10e59"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
