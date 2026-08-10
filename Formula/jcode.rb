class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.74.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.74.0/jcode-macos-aarch64.tar.gz"
      sha256 "621c0142b325f2d52d9608d31e9b12fb7d40426884162830801a137e1baae72a"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.74.0/jcode-macos-x86_64.tar.gz"
      sha256 "383522622e159e81904d1dc85b4ca5ae3dcb75616fff3fb33273aa0bb4863fe6"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.74.0/jcode-linux-x86_64.tar.gz"
      sha256 "1cc5104113be0478e62d9f234f379a46cb2f9307c105d40080f8a9c21e8892e9"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.74.0/jcode-linux-aarch64.tar.gz"
      sha256 "892253aff094c036eabb8988068b053e4233e7e25ce59aa1f0715222f2242e9e"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
