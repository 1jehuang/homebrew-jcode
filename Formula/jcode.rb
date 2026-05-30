class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.16.0/jcode-macos-aarch64.tar.gz"
      sha256 "fb958db2dc09828462472375b093ee41a714dc74b98869a71c8dcf54be9b92bf"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.16.0/jcode-macos-x86_64.tar.gz"
      sha256 "38c405e39e205b62d5f331caf82b2d455cb4404087d1093608ac42cca4659ee4"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.16.0/jcode-linux-x86_64.tar.gz"
      sha256 "a51c666b7614dc3948306559902b20f9781ff2f79549fd2620453c5cc9b53450"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"]
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" ""
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.16.0/jcode-linux-aarch64.tar.gz"
      sha256 "5327c96ebe9ac4426f525fe88be05348453b2c9df4b80b7eb15644db4774e4ad"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
