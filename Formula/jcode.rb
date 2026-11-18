class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v1.0.1/jcode-macos-aarch64.tar.gz"
      sha256 "7b11788a52b534183bf70949dbab686c47def7e1df20e912176227f3049af7fa"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v1.0.1/jcode-macos-x86_64.tar.gz"
      sha256 "f75293308aec0cddf4e729e7265904cbd9952713dc7745a051b13cf74745e0a8"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v1.0.1/jcode-linux-x86_64.tar.gz"
      sha256 "f44a54978b503e5dd27fa8781c43ec4916ebe9c4a94d42aab50fc868bf4fbe86"

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
      url "https://github.com/1jehuang/jcode/releases/download/v1.0.1/jcode-linux-aarch64.tar.gz"
      sha256 "483232d1242a5da8f168cb4f0128c66b03751ed0d14b581b3b430c0583932f51"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
