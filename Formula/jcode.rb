class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.91.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.91.0/jcode-macos-aarch64.tar.gz"
      sha256 "5bb77022d9771e71358cb6a3e495f420170cb259f2191f6095fd9b7d9cd3037c"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.91.0/jcode-macos-x86_64.tar.gz"
      sha256 "fa84b54c85ef0dde6680e94399b08f3e73938d47619808332f6cab0596587548"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.91.0/jcode-linux-x86_64.tar.gz"
      sha256 "74e9426b0a8e26c5fcff7803d6a5716f8294d1158fa63feb1b429450ac3f705e"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.91.0/jcode-linux-aarch64.tar.gz"
      sha256 "b73b76f7fc8fd8d4d3b11851525452e8d41bec88b01a40eaaa8c4c81551e5081"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
