class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.9.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.5/jcode-macos-aarch64.tar.gz"
      sha256 "9c3bfeb049a0a37cc9459bb5a336f726cf50f7268308ab9c38b6cc52dcbe8066"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.5/jcode-linux-x86_64.tar.gz"
      sha256 "6d0e8ab111de274c2904d15a9c9e0b2afb5708ee911b4b12db6cd44685dfcf8b"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
