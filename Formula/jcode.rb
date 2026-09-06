class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.82.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.82.0/jcode-macos-aarch64.tar.gz"
      sha256 "a85effdbdc348da28a770c719360ff76c8360df21e489619a4181e43a7df2baf"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.82.0/jcode-macos-x86_64.tar.gz"
      sha256 "f78b42e5b41a11e52e8c014b50bc20d28fd58aa44a1f4a369a013187daddb9f5"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.82.0/jcode-linux-x86_64.tar.gz"
      sha256 "54a412d7c8a6ce736857d6c0db38dbe8e1f541bac8700c6f0f5d6f10ccae0fb5"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.82.0/jcode-linux-aarch64.tar.gz"
      sha256 "655a0e1e80062dc3bff7f481c74b5dbe653df1461043abe30434062a42faa8d7"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
