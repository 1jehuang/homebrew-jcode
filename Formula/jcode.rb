class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.13/jcode-macos-aarch64.tar.gz"
      sha256 "fe9cf53dc07d3a4778a5f1875b9b38ef871c0ddfcdfaaf4e22210135a140383b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.13/jcode-linux-x86_64.tar.gz"
      sha256 "3b09c368a680e89448a5770d174f87f1b45714b8383348cffd70c25b6e306f7c"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
