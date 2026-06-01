class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.18.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.3/jcode-macos-aarch64.tar.gz"
      sha256 "ba312df74432c7d586fc82d1f50fdbcd01bcdc8d24ada39b68cba0e7fba47483"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.3/jcode-macos-x86_64.tar.gz"
      sha256 "b00dc092267bf48f82e59824cfeffe932e4832663be1dee893ccac31a6104746"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.3/jcode-linux-x86_64.tar.gz"
      sha256 "d86573502262bab22a4f36e4b2d147e4ac0c370b3e72421d628cf4bb79253930"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.18.3/jcode-linux-aarch64.tar.gz"
      sha256 "5982492f1cd98906ef37ec69ec16c032fd85c19ac1bacab24ebc9ad2a5a9214e"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
