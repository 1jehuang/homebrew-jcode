class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.81.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.4/jcode-macos-aarch64.tar.gz"
      sha256 "ff6d572cb1b02aa2da1e0b27b01aa2b132408175130fcd7e6610790ec478309c"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.4/jcode-macos-x86_64.tar.gz"
      sha256 "f06af0e9ecc6c33ec2e5b089f207ae2eafe7c54c73f2bc6a5c509c47e61fc926"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.4/jcode-linux-x86_64.tar.gz"
      sha256 "7e418f43b4979b50e80515776518420f8d367ad357d8d5a590f57c70a7f5529c"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.4/jcode-linux-aarch64.tar.gz"
      sha256 "a1d8aab5580b7bb50920f57f120323b4677f8bd3bda15e3f02b2b81026aa72a1"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
