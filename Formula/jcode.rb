class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.64.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.1/jcode-macos-aarch64.tar.gz"
      sha256 "e74f8bc539f8921ad085fac5de7eec14d8b7eb4fb75a54799ad57d90b8e8b390"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.1/jcode-macos-x86_64.tar.gz"
      sha256 "004bf71a893540a2c54a43c8ddcee1949980b954b16a55358fd81a6f16bd3b0d"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.1/jcode-linux-x86_64.tar.gz"
      sha256 "b221696fdd83900d43d48f5f08f945068c5c47882c2627e69113bb32b3c40fd0"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.1/jcode-linux-aarch64.tar.gz"
      sha256 "405e9f1ff2ebef5bd49da9fa544429e02fd3b8e58d782ef1794dc1fe5a41f449"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
