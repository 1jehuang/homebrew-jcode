class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.42.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.42.0/jcode-macos-aarch64.tar.gz"
      sha256 "1ccdb61c339df77ef4cfcccbeb30909df5961e045751916f2d37b3dae2e44e58"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.42.0/jcode-macos-x86_64.tar.gz"
      sha256 "e9d9ad3c403dc168a3b89a7411e853b55c72d45fd931602d484c1939a4d7ecf0"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.42.0/jcode-linux-x86_64.tar.gz"
      sha256 "5304ecbdb95d6a1511a3e52c5811ec2f50bd77856bc82ffbcfd95935228ae8a0"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.42.0/jcode-linux-aarch64.tar.gz"
      sha256 "ea97e2515ac85a2f50f9cb62679e51f1eba5624bf012854a463cb848feec4a87"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
