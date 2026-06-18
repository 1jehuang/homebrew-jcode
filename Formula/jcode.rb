class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.30.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.1/jcode-macos-aarch64.tar.gz"
      sha256 "1857475e0da95aaf30476ad86b03fd8c809a20a84fe886f3ea55073829dcc875"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.1/jcode-macos-x86_64.tar.gz"
      sha256 "dfa9301389e671b8afb99d9cffd241ca114dfabf6c43d5e46b7c908910ab597c"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.1/jcode-linux-x86_64.tar.gz"
      sha256 "dca9035c6c22668c021ed8df8be270d6ed9d407cfda8023cb81a370c37638008"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.1/jcode-linux-aarch64.tar.gz"
      sha256 "a4234b09f72f8d31c218589a1e9688fae7ffe61159773013cc4b5b551073da17"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
