class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.7.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.6/jcode-macos-aarch64.tar.gz"
      sha256 "bec430a98acd9e026cc97acfa8bfb0ef33874732c0f8d461f46ce49ff582876d"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.6/jcode-linux-x86_64.tar.gz"
      sha256 "8bc51142875d931d1ba9f2fd271c896a9e1899915db85fdf57f8c9d5d725400f"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
