class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.93.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.93.0/jcode-macos-aarch64.tar.gz"
      sha256 "1535024c7388a8bd62e142a313dc2f673a9352a36a685d0619c79ec40bdd2354"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.93.0/jcode-macos-x86_64.tar.gz"
      sha256 "01acf8ebe5079c18d42c1cd7e8958b29258254bec885f111febfdaaeedfe5ccf"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.93.0/jcode-linux-x86_64.tar.gz"
      sha256 "e9ed183ff067bc17f530e6edfddd97eff88fd817bc2281123073377f0f7567a4"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.93.0/jcode-linux-aarch64.tar.gz"
      sha256 "593adc451634896a7e352d5455b2b2e478ea22e2165cc2a06865a5a14c54388a"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
