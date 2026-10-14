class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.97.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.97.0/jcode-macos-aarch64.tar.gz"
      sha256 "3d91d51c5c9a674238863a875055dc178e7b577ecfa11120f9315881347f80d0"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.97.0/jcode-macos-x86_64.tar.gz"
      sha256 "39e6a72fb29c749580a5b1112be93988c102c7a90b499c7e9c8d90677cf65a94"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.97.0/jcode-linux-x86_64.tar.gz"
      sha256 "c7e2b7ca1618238a526c2d5920cbf28d8e7d6b89a529938c755210f76d8221da"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.97.0/jcode-linux-aarch64.tar.gz"
      sha256 "d03cfbf01e868c242b5d56a7cf7d6dbca711fb7d2ff9ce68da310cdf4f395db0"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
