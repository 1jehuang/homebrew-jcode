class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.55.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.55.0/jcode-macos-aarch64.tar.gz"
      sha256 "c60bf425dc45fd587e8fbe19142aaf202a71459a3b61a528e020a2d8dd67e079"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.55.0/jcode-macos-x86_64.tar.gz"
      sha256 "ca0ee20ac397cb681034f25c71d245f54c70823876d24521a4bf04af473af53c"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.55.0/jcode-linux-x86_64.tar.gz"
      sha256 "bf4580e65f957a0732114fc2c68d9fb2c028b806ada09eb24261486cb802e226"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.55.0/jcode-linux-aarch64.tar.gz"
      sha256 "241b2f8dd91e75cbceaab3403bfb2784626c602e7728cd528ee134968dec7493"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
