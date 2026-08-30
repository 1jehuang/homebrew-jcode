class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.81.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.3/jcode-macos-aarch64.tar.gz"
      sha256 "6a4e7c726dc8d080f888bc59b25163c3a2f75828976c33f60eb8c98f0262b5bf"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.3/jcode-macos-x86_64.tar.gz"
      sha256 "04ee6ebebeccecc956c93514fefd3f67392e9fa7fe0dfb2e04710a2f87594371"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.3/jcode-linux-x86_64.tar.gz"
      sha256 "0817f1e8cd42ebf6898519b8490f51a5d6e73709d8fe28bfa7c75514aa75e1e7"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.3/jcode-linux-aarch64.tar.gz"
      sha256 "4f0ecc5a907d92a51f91777a9e8b53e5c06431578646a64612f18850718b6684"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
