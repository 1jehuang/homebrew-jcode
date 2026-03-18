class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.2/jcode-macos-aarch64.tar.gz"
      sha256 "cf6aafb726109a6d6958fdbf2782d614a18c5470af6df4a3ed64d6b291554881"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.2/jcode-linux-x86_64.tar.gz"
      sha256 "2acba29a9738615ba060570caa13d4f32b014c8d481d5cffdf48decac4bbdf0b"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
