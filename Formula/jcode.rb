class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.7/jcode-macos-aarch64.tar.gz"
      sha256 "53c6dc5fa2e125ae3348af861db4bc1a02fe12356c5c58ad897434156a16175c"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.7/jcode-linux-x86_64.tar.gz"
      sha256 "0214b984d5d9910551c74ccb038f4f0550cdb907706bde1ba85808eb520f101e"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
