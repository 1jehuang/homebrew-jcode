class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.8.0/jcode-macos-aarch64.tar.gz"
      sha256 "694ea898c392ed94c8d3ef85531fefd1fa4908ac0c12721a731d9e0447025b9b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.8.0/jcode-linux-x86_64.tar.gz"
      sha256 "e83229dc87ff1c01a9fcf136744c88514b22fcbfef2265ade2d5c0c638bd5da3"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
