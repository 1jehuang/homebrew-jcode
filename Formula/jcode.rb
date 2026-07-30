class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.64.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.0/jcode-macos-aarch64.tar.gz"
      sha256 "249a0425b5561a4eb04ed5c449c0856adcd315d0aff7c36ba269912deb04b8be"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.0/jcode-macos-x86_64.tar.gz"
      sha256 "82480c8f7aca2afa7329e46cf3faa69d5e1a245b607f4f000aa38f9f4c6bab76"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.0/jcode-linux-x86_64.tar.gz"
      sha256 "d967a8851dd6733c75fd6e9e487de1ddb46aaf978c18b34829fcc60896ca1b8a"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.0/jcode-linux-aarch64.tar.gz"
      sha256 "22d55c984ff947239c6bfb7fbb036cf137620d4ac07ac1a13c67eb32131332e5"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
