class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.14.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.6/jcode-macos-aarch64.tar.gz"
      sha256 "e8d321ee72a94beb5393098a122da2a85b74647cce9b90cd353725c03e0565df"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.6/jcode-macos-x86_64.tar.gz"
      sha256 "eef274a13c5967a6713242b10eecc9eb7e1c78c716ee775040172413582278a1"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.6/jcode-linux-x86_64.tar.gz"
      sha256 "0c9b6bf4f9bdb522eecc8f51d8cc14c35e9ec8c286c3bbe8eb899f3b2e705903"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"]
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" ""
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.6/jcode-linux-aarch64.tar.gz"
      sha256 "f61432d1ed65165941644fafcbfe57807a8fc23d798ccd141c31c2585aae76ee"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
