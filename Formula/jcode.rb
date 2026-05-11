class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.1/jcode-macos-aarch64.tar.gz"
      sha256 "39b0558a3ce4fed678eb4f63827fba021feca91f1953639066d1b64d75681756"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.1/jcode-macos-x86_64.tar.gz"
      sha256 "2024b3dc675cbceb74458faf439ec4b3f7d3be9cfd90b0691bc7acff8b1a8ebb"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.1/jcode-linux-x86_64.tar.gz"
      sha256 "e907429ce57a0e1730698d48357ef20e371e38fea3a54e24b53dad9c0f434f04"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.1/jcode-linux-aarch64.tar.gz"
      sha256 "0e4b7c6004fe3a29800c7258ec44948ace4c169fa2b579537c10428d8aacaaf6"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
