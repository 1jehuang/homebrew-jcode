class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.3.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.0/jcode-macos-aarch64.tar.gz"
      sha256 "192cd5e575cee90ab622c8ecbb477a84521611d2d3d09a18f408519503b06e60"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.0/jcode-linux-x86_64.tar.gz"
      sha256 "b2d97b9c6850aa419f5f9e448bc4c5d17c479c65c8406ded3972ba133554a0fd"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
