class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.9.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.8/jcode-macos-aarch64.tar.gz"
      sha256 "2c123eddadfca38a97033b228f45aa63eabea2ea501f963bd44a023f630d2a97"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.8/jcode-linux-x86_64.tar.gz"
      sha256 "2ac3c2f201ff4de10d32565dd2d057ec924d9f9d3a7bd8e3fdb60a139221b7a4"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
