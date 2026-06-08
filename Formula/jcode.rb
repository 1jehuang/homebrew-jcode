class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.24.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.24.0/jcode-macos-aarch64.tar.gz"
      sha256 "388e8fc7757a698578f19ea10410691a944beb96cd95b1bc48243b9666b767e9"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.24.0/jcode-macos-x86_64.tar.gz"
      sha256 "e81f02d3a2be1ee8a5569d3a936a5a133443e08ae02fea2646b2eb192538d22b"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.24.0/jcode-linux-x86_64.tar.gz"
      sha256 "fc0787fe0f975a152232b2a69dc1b911617032f36b43701985af2d2370abe99e"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.24.0/jcode-linux-aarch64.tar.gz"
      sha256 "c0d09b3192f1e138ae61077e8fe753adca354ac8ebe15adf1ea5b0b5b938add3"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
