class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.18.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.4/jcode-macos-aarch64.tar.gz"
      sha256 "bfaa533cd85f50dd421c0189958b411ceb1879294a9d4dc47d9cb29d30e6cd0b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.4/jcode-macos-x86_64.tar.gz"
      sha256 "5b9c670ec492811dcdb927e1ff8467ec352b35e68a4ff89ab30d397d1ecc4337"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.4/jcode-linux-x86_64.tar.gz"
      sha256 "d00358352a92e44cb8c2238d28526ce9404d7438e47f105e56bd77e04a25dbba"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.4/jcode-linux-aarch64.tar.gz"
      sha256 "1ec0e6943f7d0fbc2b8e0b769070614ba32492aeaad6cb46905e6d74cf9ef011"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
