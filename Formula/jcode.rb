class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.1.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.1.3/jcode-macos-aarch64.tar.gz"
      sha256 "0c4c4b5ae1f5800dc50f6c4ae2aa3642eb9b3c6bee6d3309a8d0e2115ebd5bf3"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.1.3/jcode-linux-x86_64.tar.gz"
      sha256 "8521bef2cae2b9e4605a8c56fca1d95b8f16bb05c558dc85eacae4011c88ea45"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
