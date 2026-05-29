class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.15.0/jcode-macos-aarch64.tar.gz"
      sha256 "4d0c4bf984c5e2f9d92f016e7c702a27b933c3363a74df50b529bf0fd8841911"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.15.0/jcode-macos-x86_64.tar.gz"
      sha256 "219c72a7179d8aa53faf0057fa0e05ba63593c57515111df01d0b19b42ada6e7"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.15.0/jcode-linux-x86_64.tar.gz"
      sha256 "bf90a7ca2cb361c0848669340fb8957aaad66578bc74740de4ecce02a67327a3"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.15.0/jcode-linux-aarch64.tar.gz"
      sha256 "584129610f265054c0875a8fa8e9e1d7aa2f63bf37446f5e3f5903b5ded4020e"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
