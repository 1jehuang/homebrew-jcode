class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.9"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.9/jcode-macos-aarch64.tar.gz"
      sha256 "249f4a71b363c88338e5435a7c36e8fa5094afd7a6f37b7f5f3a4c0ba61217e1"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.9/jcode-macos-x86_64.tar.gz"
      sha256 "5b8578a45fbedbb11601c70775235311918fe2d7a70e4a75179f4fe2386cac39"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.9/jcode-linux-x86_64.tar.gz"
      sha256 "119b37291fe9402b318447d189ba407ee84cd73420c65bd185189f432422eee1"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.9/jcode-linux-aarch64.tar.gz"
      sha256 "3296f230e0ca28546fb845fc05d425e7f02b8526f8cd870c9fe8ceb41d58af91"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
