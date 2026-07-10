class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.40.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.40.0/jcode-macos-aarch64.tar.gz"
      sha256 "e6d47903b64f463ecfe97713f2efc78a107d88167f2f47e3e0756b0c4199895e"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.40.0/jcode-macos-x86_64.tar.gz"
      sha256 "0db026aa7696a49b74c21fb0ee8fd3e96d1d8f5c826923d7b8f780902029ef56"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.40.0/jcode-linux-x86_64.tar.gz"
      sha256 "6bdc09e580651b0d919505996d40b23c4b019dcd389cbcf8946e4c253ac34575"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.40.0/jcode-linux-aarch64.tar.gz"
      sha256 "39b93fe4aa1fc8391c3c8010edae7f64f64a170c64f99fddaf3d9ded2c207be5"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
