class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.10.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.10.1/jcode-macos-aarch64.tar.gz"
      sha256 "412e6482e4c3c9af4f1962dad713c8831f86d71b76e84d70bfec4340d6a97869"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.10.1/jcode-linux-x86_64.tar.gz"
      sha256 "fb88d5f6df279b0ab256177447a7df0ed826fd71455b85f09a00c5fc96396c07"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
