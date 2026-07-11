class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.43.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.43.0/jcode-macos-aarch64.tar.gz"
      sha256 "c36dc9ac3575c0c811f69720c07773382bd69f1eb146fb60ab2552723eb7c304"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.43.0/jcode-macos-x86_64.tar.gz"
      sha256 "5fd909e00388078b7ab7c321da5ca6b2d95911d2d7bad0d05cd5ae03f51ba10d"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.43.0/jcode-linux-x86_64.tar.gz"
      sha256 "cf40c121cee1590fdaf5ef0061ebee874497a13a170ca461b725430ab821a781"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.43.0/jcode-linux-aarch64.tar.gz"
      sha256 "e40f5c8fcebdb9506e186ca6486dda7c2663be4775382c52660180fe634181a9"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
