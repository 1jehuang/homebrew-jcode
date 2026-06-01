class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.0/jcode-macos-aarch64.tar.gz"
      sha256 "657a49cc34a56c3eec4f40ab8c75add2c84840d682e940078c34e517b6458bd9"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.0/jcode-macos-x86_64.tar.gz"
      sha256 "0b1d2748003a7c0bf8746765d57b90b7b40c33a32d91db51ecb911da5b4d9574"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.0/jcode-linux-x86_64.tar.gz"
      sha256 "2d012503b7e4045b45320559e8748a7918163974d48a53227be8a34704e730e8"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.0/jcode-linux-aarch64.tar.gz"
      sha256 "5c6101f907ba2ed4953b0e696d2ea67dfd69309e08ee27bab48619a0ced1f8dd"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
