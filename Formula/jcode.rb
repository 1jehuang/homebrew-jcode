class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.39.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.39.0/jcode-macos-aarch64.tar.gz"
      sha256 "0241da191c0d59c42665bd2eb24c126fbd49396fe46d84353b20bbcfd231b87b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.39.0/jcode-macos-x86_64.tar.gz"
      sha256 "573b3a84d7ed672af21b65003074f59a646a5923fc9754aa9b76b12f1c3eefe0"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.39.0/jcode-linux-x86_64.tar.gz"
      sha256 "077aad5e8224766672cef076f309c2d93a2fd6725f923ed213a010e31e10904b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.39.0/jcode-linux-aarch64.tar.gz"
      sha256 "630d0d513925968832fd52ff4cad38b5f1d88ef0800961b706edcc3aa139625d"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
