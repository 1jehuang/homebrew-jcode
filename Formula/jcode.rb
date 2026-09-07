class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.84.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.84.0/jcode-macos-aarch64.tar.gz"
      sha256 "4661f312185575b88ab500ad9c3a97861062d493fb817aa4d721b057c7130401"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.84.0/jcode-macos-x86_64.tar.gz"
      sha256 "3033c5ad0a50ae193650219eec3255b4f519c4cfbcd51521c76e599518a8ec45"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.84.0/jcode-linux-x86_64.tar.gz"
      sha256 "e00eaede1a4f26812e77382bda9d82e2d301affd983d18ada38fddd43dce9571"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.84.0/jcode-linux-aarch64.tar.gz"
      sha256 "3852a93ab86a6a2098fb45fc631de3b2fb8304c3a04044b7669becfe9146f539"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
