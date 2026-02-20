class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.3.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.2/jcode-macos-aarch64.tar.gz"
      sha256 "48c04fcaa3b41d82fac1244063faaf6b35aa59dea58ab132b30686277859c831"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.2/jcode-linux-x86_64.tar.gz"
      sha256 "22959519239f77d32277964b04bb81925655d85aa4b4a487161b82b0de5cbd29"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
