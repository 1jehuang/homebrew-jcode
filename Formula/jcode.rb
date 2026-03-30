class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.8.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.8.1/jcode-macos-aarch64.tar.gz"
      sha256 "47da8b031483e23bdb5dd59cf7a479148b9a965d793ddcf1a89a2a972822df19"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.8.1/jcode-linux-x86_64.tar.gz"
      sha256 "7a76541c72acfbf591b4c4b7e06057327ce7dd120cd030158c755f778e880e5b"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
