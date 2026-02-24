class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.4.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.4.1/jcode-macos-aarch64.tar.gz"
      sha256 "a6566fc3dd6f6d385522d976ce9400193f7c90fa90dbacd968bb8bbc0613d98b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.4.1/jcode-linux-x86_64.tar.gz"
      sha256 "fbe559e751e730180d707efb84389849c7f292198541afd5dc0ea0b2d2e97312"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
