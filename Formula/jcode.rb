class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.94.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.94.0/jcode-macos-aarch64.tar.gz"
      sha256 "f834d55ba3102057f8c8a902b7b761c748dc3a006ea0af3cca17ec358c4fa845"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.94.0/jcode-macos-x86_64.tar.gz"
      sha256 "e32331c9e31bdf05afdc71b41723df2314cd26e9ab8d2093f82373d81126135e"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.94.0/jcode-linux-x86_64.tar.gz"
      sha256 "e471f61e661612cfd6da5e9c1bb8238fab0c63c3ebc96c648439816649478c1b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.94.0/jcode-linux-aarch64.tar.gz"
      sha256 "cb1a96c2da17ee8c0c5321253612650503e47629f7910eadc37d513d9b14d840"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
