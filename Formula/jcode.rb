class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.1/jcode-macos-aarch64.tar.gz"
      sha256 "1a5526e3dd1c35da2c02ec430b72f420dc53e419a44566422ee394bf2d88f1a5"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.1/jcode-linux-x86_64.tar.gz"
      sha256 "58b60fe476f91560a5f65753141609fba176ef082feb46a5605b96bf5f81bf4d"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
