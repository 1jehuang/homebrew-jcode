class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.75.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.5/jcode-macos-aarch64.tar.gz"
      sha256 "d6feec2f94edf03abac9b653261df4fb80dfa51006d8fd55d3f9a8fa62efcdf2"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.5/jcode-macos-x86_64.tar.gz"
      sha256 "8ec2702e57af26f9836e4ad99cf457e6bcb20c0f669a8f6ab2280df6df2a6ff9"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.5/jcode-linux-x86_64.tar.gz"
      sha256 "1c3ae4dc9b0e6eaa98238359c44110e3dc347c96d736939a839347e95a91459e"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.5/jcode-linux-aarch64.tar.gz"
      sha256 "c6613c41e774da92b52dbfb0ad13662ab066ec99486805cad0377567e5e58712"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
