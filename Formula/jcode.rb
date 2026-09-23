class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.88.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.88.0/jcode-macos-aarch64.tar.gz"
      sha256 "58378d532839dffb9c146542e56fab1ae0ec2e69cb74cffb9fc4309b2e536f2e"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.88.0/jcode-macos-x86_64.tar.gz"
      sha256 "f0ccd2d0cab805c1eb6e5f51e509b109fcd02a27d2d8ac0bb181e29346baa872"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.88.0/jcode-linux-x86_64.tar.gz"
      sha256 "72146cac4c6247964f22b1f4d8bc6b968bdd707d042ef716a791c5bf4bf7f530"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.88.0/jcode-linux-aarch64.tar.gz"
      sha256 "b69e3b995f244745925f3e3c371bf41e8f90c1ab9adfe36c3d6ef2e40b763994"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
