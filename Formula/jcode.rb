class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.2/jcode-macos-aarch64.tar.gz"
      sha256 "df4474ad62c292d5493472bb3f98e88ffa4bc5cf50fc35fce636fef329e4c87c"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.2/jcode-linux-x86_64.tar.gz"
      sha256 "06cb67f964d5400b173106227554c9b07fb8160d197e809bc58e6dd4a69bd22c"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
