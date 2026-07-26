class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.60.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.60.0/jcode-macos-aarch64.tar.gz"
      sha256 "0a3e694d565344d871e921a1f4149c59a483c9d304c9064134dbcc6c4d5a56b6"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.60.0/jcode-macos-x86_64.tar.gz"
      sha256 "652a3bdf2bf531dc616f1c247644d7a6f6175813e1b0678c4e3fb22fcabfd209"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.60.0/jcode-linux-x86_64.tar.gz"
      sha256 "70a341388417b202d81c1447c25410d77d9c760f4615c84a40d9e818b781e8f8"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.60.0/jcode-linux-aarch64.tar.gz"
      sha256 "2c77a1950333bf99e019b4fc116e35400c20c9fbd27262ad1bc860b4911ae6fb"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
