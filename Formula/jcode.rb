class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.95.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.95.0/jcode-macos-aarch64.tar.gz"
      sha256 "14d7f4f4c942b785bb3ac158d813392fff0ea5e68c7f8b871c466b8411234b90"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.95.0/jcode-macos-x86_64.tar.gz"
      sha256 "f4b1d05df024feeb016ca2bab80fa8584183aacfe5e8cbfacb8f92296bf7e038"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.95.0/jcode-linux-x86_64.tar.gz"
      sha256 "c6c903de5e82101f024962204432f1a2c8a5bbd872f3e52faf9f276f7fa4cf8c"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.95.0/jcode-linux-aarch64.tar.gz"
      sha256 "322db18677856daedab9a4293722ed234d81740aa367c07d3537b83706311f44"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
