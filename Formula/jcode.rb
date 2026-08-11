class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.75.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.2/jcode-macos-aarch64.tar.gz"
      sha256 "4f22fa7de2f1ea14270d8202122c73df1ece1274282aeb7469674c8e6f5e2bac"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.2/jcode-macos-x86_64.tar.gz"
      sha256 "ff1fc326361bb0cb58376956f6130cf8c1714cd4c401d428abc5d04d5a532827"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.2/jcode-linux-x86_64.tar.gz"
      sha256 "fc0fdb6e31d23a189d0775f13f6634c8da87734b125dbca207d8b7e6a12caee8"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.2/jcode-linux-aarch64.tar.gz"
      sha256 "6a6cb9a592c49799833a905b1e9b17b184f9a230ca384c379d8efb9ef9b49959"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
