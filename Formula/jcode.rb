class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.31.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.2/jcode-macos-aarch64.tar.gz"
      sha256 "504915b45449fb5d32b5a9a8b732e958edc17ed1811f20770c9d1b12fce4d02b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.2/jcode-macos-x86_64.tar.gz"
      sha256 "4f01552931b650635ec69d6e791ca5efb26bb13eeb2b784bb33b938dc8987594"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.2/jcode-linux-x86_64.tar.gz"
      sha256 "c4636392018726c58e82a61096dd98bc1320356c2d452e42da3237e54f871950"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"] unless Dir["libssl.so*", "libcrypto.so*"].empty?
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" ""
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.31.2/jcode-linux-aarch64.tar.gz"
      sha256 "34c2a8f0a29e5c254794b619ea318694df4fc98dbf0d34adce3969dd28f9a766"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
