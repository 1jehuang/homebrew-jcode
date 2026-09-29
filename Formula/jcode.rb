class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.89.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.1/jcode-macos-aarch64.tar.gz"
      sha256 "0fd2e914676c47dcee0d415cae404d7cbad9aa1003fb6bd6bda65af38edf069d"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.1/jcode-macos-x86_64.tar.gz"
      sha256 "20f9b9059c56fe3616fde78d18f439d06a0a0a44bfb20a8c6ea00b6500c6070b"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.1/jcode-linux-x86_64.tar.gz"
      sha256 "a0218a55e0462d399eece05bcabf4b74dcc9c05e6924299f44da55fea70e9974"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.1/jcode-linux-aarch64.tar.gz"
      sha256 "77ef69669f6e7a6971a0ef8f61c20ad4f20cd7a31b57bc525766f48fadedd926"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
