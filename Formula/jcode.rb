class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.3/jcode-macos-aarch64.tar.gz"
      sha256 "e0972876fb4efad416f721ebc12e27900034c3ce18d2f9ae47b14c07626faaf3"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.3/jcode-linux-x86_64.tar.gz"
      sha256 "329da7e6836d78e4c02ba4ea91ac9642a74f6c2ccd534e252b16454bc3af17d9"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
