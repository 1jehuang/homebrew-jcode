class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.14.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.2/jcode-macos-aarch64.tar.gz"
      sha256 "cb11c96d12586066f74b8b3bca0ced0629a309e021c35b8a9777009a61167b2c"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.2/jcode-macos-x86_64.tar.gz"
      sha256 "b37033e12a2739e343978a85ffd9e6bb77e77451483b5c088eb2189ea452cbe6"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.2/jcode-linux-x86_64.tar.gz"
      sha256 "8f5c3c9825d25d235c60394a87c37b54c23479f8fe4e8818d92886da87aca613"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.2/jcode-linux-aarch64.tar.gz"
      sha256 "ab21e689c66fe8891e80d67ea15f75c7fd1c724b8f7834a33b747b7890ce7366"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
