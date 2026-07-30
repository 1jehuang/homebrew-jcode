class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.63.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.63.0/jcode-macos-aarch64.tar.gz"
      sha256 "842b3f4649dfd457e73e7aaeff3ded908cdbe9ee629e5badd320c209bf006908"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.63.0/jcode-macos-x86_64.tar.gz"
      sha256 "e319020b0a72a7e4d5a5ebdab5d23649cf265b21f970572ea61d2b4ae33e69aa"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.63.0/jcode-linux-x86_64.tar.gz"
      sha256 "c35e75fdee3152162006e7056501eaf6900d50583cd12b1c7f82b94aad1a5e58"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.63.0/jcode-linux-aarch64.tar.gz"
      sha256 "b21b9a1d547c175ef0e1cee857025a53c2b485fe8b3974af589aa57cfd009c5b"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
