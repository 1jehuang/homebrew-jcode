class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.81.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.2/jcode-macos-aarch64.tar.gz"
      sha256 "6a3c716383f23e8befe8972033bd1a377f5b2b3c6db180faa02354da603b11c6"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.2/jcode-macos-x86_64.tar.gz"
      sha256 "ee2105c5947a57f8bcfb31c7a4824584480fff26a1859c6dfe1e41218d7971ef"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.2/jcode-linux-x86_64.tar.gz"
      sha256 "2fe135c35e7e150c2ab8ad5a31d3e805ccc313b44cc94e17fa8128f66d7cb3df"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.2/jcode-linux-aarch64.tar.gz"
      sha256 "767fb056b547467ba778dc4a3a1155a47716a6561bf8fe97f52dd6853500b47d"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
