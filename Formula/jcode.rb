class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.67.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.67.1/jcode-macos-aarch64.tar.gz"
      sha256 "9524278408af007d9d497a5f1a9e7a55d9a466b2289e19f0b1bd01f19d7af97f"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.67.1/jcode-macos-x86_64.tar.gz"
      sha256 "e1d9dbbae0b0c8958c6674e27505723f09b57e988dc2a59d933f65c14158dbf9"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.67.1/jcode-linux-x86_64.tar.gz"
      sha256 "34e563d7c430196815f9d5c4fb5e12d1bc6a03c926008c9d43b503792d0e9ff8"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.67.1/jcode-linux-aarch64.tar.gz"
      sha256 "72c395a51fb13df03ca8d49603d2a2c4f886d4d9ec66937618d3a32e4cd751d8"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
