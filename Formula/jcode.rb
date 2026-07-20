class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.54.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.54.4/jcode-macos-aarch64.tar.gz"
      sha256 "b041bae921f5ee2bf17f9d44f94ffc77b093b3bec3a9dcad52231596ba71fdf7"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.54.4/jcode-macos-x86_64.tar.gz"
      sha256 "2484f2124174aef907bd2ba6eff7067999ad3b85bc7bff4726c5d72f991cc305"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.54.4/jcode-linux-x86_64.tar.gz"
      sha256 "375b01437a9d312b3fe9c5aff6bbd4b654f1a564662e2b9f51266e807291b1ec"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.54.4/jcode-linux-aarch64.tar.gz"
      sha256 "a2a858dcbbbd39afb22a16f4306547921387a41831621b449b031adc9c7ec180"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
