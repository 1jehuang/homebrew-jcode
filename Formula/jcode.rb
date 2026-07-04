class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.35.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.35.1/jcode-macos-aarch64.tar.gz"
      sha256 "6e4ec4c81f0855589a1d7e2308dfdb5ec0d91e59960843dd0bd4d1d8b2690bf1"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.35.1/jcode-macos-x86_64.tar.gz"
      sha256 "062bae2d3d8bbd9eabdeab0b1cba4e09c4a16146e9c526ee824ca56af4570f27"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.35.1/jcode-linux-x86_64.tar.gz"
      sha256 "82e8d7e2eaf7ed7bda16221d95db1c9aea731dbd66de3dfc7c9f64be3896dc03"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.35.1/jcode-linux-aarch64.tar.gz"
      sha256 "f2719d2bdd0cf38c7ec9f6f756f0835dd656ba91011c0e6cd2dc5559bba277dc"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
