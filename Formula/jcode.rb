class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.12"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.12/jcode-macos-aarch64.tar.gz"
      sha256 "21b78350a69f6940ce8d650c4dfeab87307a84f6e75c4d8f0c868c533e01f1ad"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.12/jcode-linux-x86_64.tar.gz"
      sha256 "aff8233a27cd2f837fa821aee680ee152e0b566f6de641325fd49898392a3797"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
