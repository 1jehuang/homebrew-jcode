class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.6.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.6.1/jcode-macos-aarch64.tar.gz"
      sha256 "b4d636debb3994be4a874826d795daef3f46fd881b152fdb190eb5cbc4539591"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.6.1/jcode-linux-x86_64.tar.gz"
      sha256 "30350cea8a1cee5db053db0bda51ccebad80b83716c8ce18cf4a627dd340a3f2"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
