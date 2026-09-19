class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.85.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.85.0/jcode-macos-aarch64.tar.gz"
      sha256 "3bac0f1de2e5f358392d52a504032234616d1e941e14aa7e774476fd509dcac7"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.85.0/jcode-macos-x86_64.tar.gz"
      sha256 "89766d9acc32bc60cf1339882af28c1be3fc257c423d02ddb8593cc800bdf1bf"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.85.0/jcode-linux-x86_64.tar.gz"
      sha256 "3b6b0137a475c557a63240eaeb6cffe1fcca074a9b79180d37218a5fead21c15"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.85.0/jcode-linux-aarch64.tar.gz"
      sha256 "db56bcc8c41299244dfca7fd1dbb5a39534290bed488b00a7e147a613023dc8e"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
