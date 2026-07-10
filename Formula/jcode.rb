class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.41.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.41.0/jcode-macos-aarch64.tar.gz"
      sha256 "eefd272eb82ca4342f05bcf06f8c88ac71fdc9e46dbdb4287215638b2b1f77b2"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.41.0/jcode-macos-x86_64.tar.gz"
      sha256 "f9c4e7ba44f312a44449bca88527e282e190fac9aecff4ee13569403ff5ecf0e"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.41.0/jcode-linux-x86_64.tar.gz"
      sha256 "1794561fab0a4a334f0fcf5fc0a200f3a68de99b1cd431635d675af21ff8753b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.41.0/jcode-linux-aarch64.tar.gz"
      sha256 "1d8845de10e8ef1ad2b8be0bb1e34c549f29a0d8deef783c7b5190c8c2922a19"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
