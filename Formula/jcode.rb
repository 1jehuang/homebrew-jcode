class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.57.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.57.0/jcode-macos-aarch64.tar.gz"
      sha256 "d491e09ebab0fd97a241280102255b7f08c467fdad6ced3a3139e7e6b29e5cb8"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.57.0/jcode-macos-x86_64.tar.gz"
      sha256 "c9f8a38117da9f4f54ae8f52b9f9869d1469703f604fffa5b431206d6ed1ee8a"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.57.0/jcode-linux-x86_64.tar.gz"
      sha256 "024f6ea1ea5e354fa4021929dba94faac09a4fba605ddfb6832f5d9809d61a6a"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.57.0/jcode-linux-aarch64.tar.gz"
      sha256 "6d95c3535e9e5ab4e6b3e68ab02647594b45e317a12d80c8351331664bc1f419"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
