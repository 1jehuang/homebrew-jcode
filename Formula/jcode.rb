class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.6.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.6.2/jcode-macos-aarch64.tar.gz"
      sha256 "13c2b0cee10fe06a49a44fcf89d18342986963aaf3f4b480528678abff310ff0"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.6.2/jcode-linux-x86_64.tar.gz"
      sha256 "e993916f5d3c3ecab4bc261e928ce42ad703fa2cd30b00ff93acd84384111ea8"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
