class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.38.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.38.0/jcode-macos-aarch64.tar.gz"
      sha256 "f38de50cbf23ef270d5d982aff77ab642b21500e041f8e2c01c35f3133a67239"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.38.0/jcode-macos-x86_64.tar.gz"
      sha256 "f465b2107b0cb17cd845e1e49d1ab9cda8ac88ce3aff3bf7ce04d9ae03d976a6"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.38.0/jcode-linux-x86_64.tar.gz"
      sha256 "e2dac02fb27a6e8128512309b3dd0ee2411ff468603378eb8b3202ed88305f79"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.38.0/jcode-linux-aarch64.tar.gz"
      sha256 "1d6e4118c4a274abf8b1b0839e51af69e3fe64b78c86a1a67212c9ce769ed75b"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
