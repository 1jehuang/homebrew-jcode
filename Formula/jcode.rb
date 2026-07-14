class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.47.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.47.0/jcode-macos-aarch64.tar.gz"
      sha256 "4b8e7d9df72a0774dd5620b8c3b6efd4e8554ced38f01df792a14f031a1edf96"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.47.0/jcode-macos-x86_64.tar.gz"
      sha256 "df742c5e83306a0eb4b6a1ad204e6f06336e6929a998f4800893871e2affc224"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.47.0/jcode-linux-x86_64.tar.gz"
      sha256 "04902a3eff1ca87873c32157c2e12a182960cccb641fea7d026d394d28ef77f7"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.47.0/jcode-linux-aarch64.tar.gz"
      sha256 "b80359fab3e83060b3964101a0fa0c0d1d49d5ed07f7872f9078e5177f2338f5"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
