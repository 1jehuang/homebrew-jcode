class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.81.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.7/jcode-macos-aarch64.tar.gz"
      sha256 "3256d24831ca1c0b3820a03a99d4c782fbc40f740260633dbc6e6a711d47fd7c"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.7/jcode-macos-x86_64.tar.gz"
      sha256 "5761f53c2c15aa810f38ed6dfe00597ed75dda808243272e8c963ea5a4ad1d46"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.7/jcode-linux-x86_64.tar.gz"
      sha256 "e75d50fcbf729ed7a96d78e1970c2b10bacf7626e844a3eb7ca2c5f4ccf9590b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.7/jcode-linux-aarch64.tar.gz"
      sha256 "499b0a877f6d46d1b315a0d11e7ce9f6d8deea36f2f0b0d11d32296dbf9af017"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
