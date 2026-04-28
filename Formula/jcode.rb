class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.0/jcode-macos-aarch64.tar.gz"
      sha256 "b7825ef72533af107ae250d53c11f1394f2aed950fcc17c972f7a2f22a9d9e67"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.0/jcode-linux-x86_64.tar.gz"
      sha256 "cc69aea314d259d86fa3a157cefed677314aab0345d42cc2e6dacac9a5664fa7"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
