class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.87.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.87.1/jcode-macos-aarch64.tar.gz"
      sha256 "7fbe077a5527d2124ec6b0d24557f8f04c0c0b5756fa5c8342d116f3736e22aa"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.87.1/jcode-macos-x86_64.tar.gz"
      sha256 "215ecaabe705651dcb5111d64b87ac63035c5dc57311ef2c9827d2fa9ae91937"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.87.1/jcode-linux-x86_64.tar.gz"
      sha256 "6a6cf23d1daf67b593832c04a130678a50f3cd4ab49c6192d634a369d2808371"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.87.1/jcode-linux-aarch64.tar.gz"
      sha256 "01ee0565c4239de2467dec230f9610bdbce861fcfd37006517d47bc5bfa68500"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
