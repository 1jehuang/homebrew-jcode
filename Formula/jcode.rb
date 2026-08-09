class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.73.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.73.0/jcode-macos-aarch64.tar.gz"
      sha256 "1729ace87d295f7ad942de99eda87e63eec8cef5adb1765609d8269dfd8ea613"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.73.0/jcode-macos-x86_64.tar.gz"
      sha256 "ae11ded4c2423ae7448d8f4e336d49eb581e28e6ae673ff7440460a093791a5d"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.73.0/jcode-linux-x86_64.tar.gz"
      sha256 "fd306a80095194c5535003a080c6c9bf8b30e9d6f9e65526ba2c6183f8779922"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.73.0/jcode-linux-aarch64.tar.gz"
      sha256 "47fa49b91aa80d7c5967fbf3d888d0c79f4c9cbfc97165e1a40ea2387282c6e3"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
