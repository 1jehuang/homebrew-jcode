class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.0/jcode-macos-aarch64.tar.gz"
      sha256 "ba47782e079cfb146b097d7bf5df8083e9c93977b3d5bb8b7ad1c852db4a83c5"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.0/jcode-linux-x86_64.tar.gz"
      sha256 "c6362a76884c95e7d0f03ea813eca929fd0fdb7f1567552447f544a85cd0924e"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
