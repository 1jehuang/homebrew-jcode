class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.81.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.6/jcode-macos-aarch64.tar.gz"
      sha256 "08e79a3489e350319ea279c346e43ee9ddd403c55e4fd3aad2574f6267335aed"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.6/jcode-macos-x86_64.tar.gz"
      sha256 "47f0830bf38dadd9e3db7ccf98a0085a61ee6c87bd0ec12d87da7a5e1e67bd75"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.6/jcode-linux-x86_64.tar.gz"
      sha256 "fcb784e02f4320c0acdb604eafb0cf41a0d1d7ef93ba1b6d1a289bb2df93cfa4"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.81.6/jcode-linux-aarch64.tar.gz"
      sha256 "4196af41cae4cae87f0dfd97f068babfb15f257d5181a1ac3b32a786a0331c1d"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
