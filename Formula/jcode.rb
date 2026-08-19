class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.78.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.78.1/jcode-macos-aarch64.tar.gz"
      sha256 "9db454f052960e08735de627731e58ec5fd937115d747161d3e2be21b7c4fd53"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.78.1/jcode-macos-x86_64.tar.gz"
      sha256 "c866972cd8e8667e95eea7c3bea86623653949e881f68b92dc3a640bd78a3574"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.78.1/jcode-linux-x86_64.tar.gz"
      sha256 "4a0c45bf8485785faaeb56384f4741e074e403951a2f179c88ff8c32a7ac3b53"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.78.1/jcode-linux-aarch64.tar.gz"
      sha256 "91ec4fe88f04aab8f6b294ee319e66701e273a9077003d24fcbf17d14562fd56"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
