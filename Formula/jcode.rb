class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.81.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.5/jcode-macos-aarch64.tar.gz"
      sha256 "dbcdf1f7596908c43d731b1539669e9a40b819e09137af011d29cae2307d0bd8"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.5/jcode-macos-x86_64.tar.gz"
      sha256 "b2e37d1b99a636b60aea334febcf291a63077034ae73637cc570fe4424ae0943"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.5/jcode-linux-x86_64.tar.gz"
      sha256 "7e941f582e11c23c806e074d8c6c3db678371ff41d862f2fe9bcf7b06358077d"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.5/jcode-linux-aarch64.tar.gz"
      sha256 "9c2004d8b0781b5ad2a662efdcad96acdb375ef47b4dcfb09f2a4d47fd39f1db"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
