class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.21.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.21.0/jcode-macos-aarch64.tar.gz"
      sha256 "522c355289426add25146778ab2f8d07dc29255417ce7a46afba7127babc0153"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.21.0/jcode-macos-x86_64.tar.gz"
      sha256 "79e42aeeac8757583ab59b74c265f4fb8aa3c517e7efe32fc094edeb4cc8384c"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.21.0/jcode-linux-x86_64.tar.gz"
      sha256 "280848d4bb62227707d92b7cf7f0d2518b4dd181087477cc404fa885f2215f4e"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.21.0/jcode-linux-aarch64.tar.gz"
      sha256 "cf6d2a3962f8e508e2ac4168d00238607d730c723c93555673688e587b38213f"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
