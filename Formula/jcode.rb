class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.12.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.2/jcode-macos-aarch64.tar.gz"
      sha256 "a6ec925c54bfee73fadaed914567d58acdbeedf6d7f2f4b5883c00635a308c20"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.2/jcode-macos-x86_64.tar.gz"
      sha256 "6b59f80a5c9359c156a425138e61d2fb72b720f25c90afaf1b6901229ed0fcb8"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.2/jcode-linux-x86_64.tar.gz"
      sha256 "411882bb788554f78973829b98f9567280bd25e15e8bd59e0e7de189204885dc"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.12.2/jcode-linux-aarch64.tar.gz"
      sha256 "6c5d08db32747d07de4385e602f11ddce61d20c4d850e0c0b5c09069d95cf724"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
