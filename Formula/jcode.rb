class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.19.0/jcode-macos-aarch64.tar.gz"
      sha256 "3cdda45b3671c6267fc1163235c7c0450be4be126ddfe82ba59d08770359bced"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.19.0/jcode-macos-x86_64.tar.gz"
      sha256 "ca572ae1e181d5c12a2f61272d542aeb420b549ba2a1a7aee9790e89ad4a6c74"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.19.0/jcode-linux-x86_64.tar.gz"
      sha256 "2b460e3a48b8e1ba4ae73254d2dcbe15bd504aba09f6d52fcc4cefde38d27b2b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.19.0/jcode-linux-aarch64.tar.gz"
      sha256 "eab0ac00c62d85ebc7921973a91adb9352dd74e4cfd1b860e4786ca5f258eaaf"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
