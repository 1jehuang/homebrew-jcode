class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.51.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.51.0/jcode-macos-aarch64.tar.gz"
      sha256 "5e1a448932df35f3fde5d3f420b085ac7005064c4719b8158b751efc1ff58230"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.51.0/jcode-macos-x86_64.tar.gz"
      sha256 "8445fcdc71c014062e4fffd739c809c281b69b7300ed2a928bd70295e78e9efb"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.51.0/jcode-linux-x86_64.tar.gz"
      sha256 "1f4baa3957cfdf1a67a3eac1a0db061fb5c9e44588a17b38be3c105048329aa3"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.51.0/jcode-linux-aarch64.tar.gz"
      sha256 "44f8788a5339537dea3728fc45ef40430212ae71ac86538763a73cc3ce3479bd"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
