class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.75.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.3/jcode-macos-aarch64.tar.gz"
      sha256 "af02b2518be64fb5a3935740b941f44f05f0203415a64d7aaa07362abdd6d4fd"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.3/jcode-macos-x86_64.tar.gz"
      sha256 "8c1ab47f02823cd3d0838d323687c3788df094e81cc4a048d71879b05e2d5482"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.3/jcode-linux-x86_64.tar.gz"
      sha256 "aca6db160325c79662c15967da117d12f4a37f95ec0660ca3f93bed6fd31420d"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.3/jcode-linux-aarch64.tar.gz"
      sha256 "efd1d1e8f6d1da5afbff5190d578bf9261cc7cc2521779a5d749f2c3f497f506"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
