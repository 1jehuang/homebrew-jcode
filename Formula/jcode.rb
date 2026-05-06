class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.16"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.16/jcode-macos-aarch64.tar.gz"
      sha256 "49969e2f8a1597547b8e4a1e489b950da9177eef1b1182d2d877061637a77097"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.16/jcode-macos-x86_64.tar.gz"
      sha256 "1bca42af3c423aee3df620dfb456aee1824cb897f28dbdd16319a266ddbdc4e7"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.16/jcode-linux-x86_64.tar.gz"
      sha256 "56b9e19deea0179582c36df59ac6f45107d998cc207ec409e943a9edfd1b83ff"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.16/jcode-linux-aarch64.tar.gz"
      sha256 "5aef751dd39eb50822a3815a5f74e34382136641fff5fd8fdff1eaf1a9ccdb11"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
