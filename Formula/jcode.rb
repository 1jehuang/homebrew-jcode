class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.99.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.99.0/jcode-macos-aarch64.tar.gz"
      sha256 "46df33fabe7d30de9fd4b44684d0d402606edec04d793d7d8391c79807acde62"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.99.0/jcode-macos-x86_64.tar.gz"
      sha256 "6debb6b8687f03126831331e1c0de939db7fadedda3c11d02303e84843dbe99a"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.99.0/jcode-linux-x86_64.tar.gz"
      sha256 "d595e38bf8629730487da7f2c3eed79b9935d442ceb6af4cc89ff49ed7013cf7"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.99.0/jcode-linux-aarch64.tar.gz"
      sha256 "11d8534227a8234963f6c0aa2ed26a6386380a0709bbd061ced6ec46fb5ec69f"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
