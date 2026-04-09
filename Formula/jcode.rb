class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.9.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.7/jcode-macos-aarch64.tar.gz"
      sha256 "60d984d649c107a321bf808c7127737ff17d77cf8f17068f0c474603c2a7f8cf"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.7/jcode-linux-x86_64.tar.gz"
      sha256 "06175d21d7350ceb7630722d25da34a81a96274662144f6e5c691be6504277bf"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
