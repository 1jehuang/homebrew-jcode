class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.15"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.15/jcode-macos-aarch64.tar.gz"
      sha256 "c8d3432b284a5465e38dc19f4a5af4abfc82c2762015c449ac00e0c6c7e2d5dc"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.15/jcode-macos-x86_64.tar.gz"
      sha256 "6a1f2a45f6821136aba7ca2b1cea3a6ef5c5009789485b7230629640e11e4f82"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.15/jcode-linux-x86_64.tar.gz"
      sha256 "c42f2ddda67c0e0d104c051d53b014f7f02fe3828e28e4759918843a35427b4a"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"]
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" ""
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.15/jcode-linux-aarch64.tar.gz"
      sha256 "6fea9c5ce3bce099a77f8b1b7f827905742295c7f4c09bb17a6bddab0e11ac6a"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
