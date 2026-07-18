class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.51.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.51.1/jcode-macos-aarch64.tar.gz"
      sha256 "5e9f10e674df563073c7084ea9d2633c78e6ced3fb453cc1f01a0aff6c00cc6a"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.51.1/jcode-macos-x86_64.tar.gz"
      sha256 "6a0ccad61455b016328a5978c204bdbc0f63a90509d5cb8ed59390a2fdc2c603"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.51.1/jcode-linux-x86_64.tar.gz"
      sha256 "d55766ce9cb8dab06a38c113b02532c0e65db87f10038f76a3147b38d62e286c"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.51.1/jcode-linux-aarch64.tar.gz"
      sha256 "b914b116b1a22f4d3cd5e981da1a246032cbfaeabee6eb09938e2fd7112f0bb8"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
