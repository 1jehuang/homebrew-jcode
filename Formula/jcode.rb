class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.80.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.80.1/jcode-macos-aarch64.tar.gz"
      sha256 "94a880f1ee8b6da7721ada397473767a3adcc46afc6cf1e44e0e5d734cff18b5"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.80.1/jcode-macos-x86_64.tar.gz"
      sha256 "9ce1a43267f5c5302b056575b81ca3b6bae6f3e64741cd9bfddba8a9eced4ade"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.80.1/jcode-linux-x86_64.tar.gz"
      sha256 "3cc986a719437398e840666b28e04d11a3095fa7aa582537071b30baf76f4bfd"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.80.1/jcode-linux-aarch64.tar.gz"
      sha256 "f82617eb3c1578c29244d7ed05123f08185d927b05fe4d5c489784037b0beff5"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
