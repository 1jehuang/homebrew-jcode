class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.86.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.86.0/jcode-macos-aarch64.tar.gz"
      sha256 "1513e823ae956566c42051c0b91bae4a5017d005f854a1595fda35a83e6bfd0d"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.86.0/jcode-macos-x86_64.tar.gz"
      sha256 "4b97abab30b4416d06129613187a904dea03115681359105be5a1670af117815"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.86.0/jcode-linux-x86_64.tar.gz"
      sha256 "e5fdcc93b5b832e1e44ed0273e930fe0781dab13e74a54136db825e37cd31e85"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.86.0/jcode-linux-aarch64.tar.gz"
      sha256 "0525a681c1d281643f3201f2e7253e8997e4b750112d3846bb2e325cb49003c4"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
