class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.17.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.1/jcode-macos-aarch64.tar.gz"
      sha256 "edbd56e7824cb535b89e88c7127edc3513cd404dd5971845d93832093c780384"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.1/jcode-macos-x86_64.tar.gz"
      sha256 "36c1536f026bac0963f955fd7104c6da15c7ce2445a363152c618c87967a0f93"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.1/jcode-linux-x86_64.tar.gz"
      sha256 "1025e2e9449adc15aaa3fba0d2262b9b3d4d862a94b55f4fecfaee456835568e"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.17.1/jcode-linux-aarch64.tar.gz"
      sha256 "f5a25f29f485105ebe0bc3a986404ca25ec9c5d4055adac51c2aa3ee0303ba77"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
