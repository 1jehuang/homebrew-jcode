class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.6.0/jcode-macos-aarch64.tar.gz"
      sha256 "ade728590f8fd8f2faa29c48e12d759368bbbf7f75a7d5fd78bb78e37f49f6f9"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.6.0/jcode-linux-x86_64.tar.gz"
      sha256 "44d9009a6725d7eb993521e7119c0c37bf539fd41a605332cf79604170d6af57"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
