class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.12.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.4/jcode-macos-aarch64.tar.gz"
      sha256 "e8cf23c5011627c323480a6d5ca259c7951e0fc2124b01c66c66871874377b67"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.4/jcode-macos-x86_64.tar.gz"
      sha256 "7aa13d6ea57845ac5cf24817148704ef7b3ea8b22526e215fae5e85cb7ec8ad2"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.4/jcode-linux-x86_64.tar.gz"
      sha256 "8e4cb96c41edf75f8cbd21765a8d48186d4952bcb365f82b52f1569512c3d8dd"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.4/jcode-linux-aarch64.tar.gz"
      sha256 "73de4f446ed407060f2018e15d855dc980716b64f9b6dc501d45dcc23b6da0f0"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
