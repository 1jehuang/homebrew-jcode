class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.89.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.0/jcode-macos-aarch64.tar.gz"
      sha256 "afc1a0b8e19a92b9dfb38d78d708ce2afbf3f9b898150eca17e7e350dd82c7eb"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.0/jcode-macos-x86_64.tar.gz"
      sha256 "c9bb7efd675f8fbebf671a309b683f3adbfd5b68d56547841247e3594044fb63"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.0/jcode-linux-x86_64.tar.gz"
      sha256 "272b21588c7eb604047a133569c458e0bb42b7b65b5183d3301234bce926eeb0"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.0/jcode-linux-aarch64.tar.gz"
      sha256 "4f0e4aebe4dbf41f240865cc30bd85b26045593fa7909b91513d3b0165c67309"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
