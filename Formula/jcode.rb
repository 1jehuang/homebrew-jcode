class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.90.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.90.1/jcode-macos-aarch64.tar.gz"
      sha256 "2ffdb68310105b88b893757323d894f6cd9f54dbc95c3684a64a8b84a40c2dfd"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.90.1/jcode-macos-x86_64.tar.gz"
      sha256 "2860f12f0a45a68cd7417fce8ea55fccb553aa0e199bab425e1205ea0ece7b7f"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.90.1/jcode-linux-x86_64.tar.gz"
      sha256 "9a46e0cd4b66416177e78384614787323be7a9d195832733664e8f0354a9927b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.90.1/jcode-linux-aarch64.tar.gz"
      sha256 "85c095f6ec90bdf06cce2ee9666fa40fc74d05c6aca65e475bc12978af45f16e"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
