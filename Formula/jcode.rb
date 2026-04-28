class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.1/jcode-macos-aarch64.tar.gz"
      sha256 "9f631933ad73caac770c1c8eea303d6cb24cb6cc67d47164f4a42e0920a2a627"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.1/jcode-linux-x86_64.tar.gz"
      sha256 "94074c5810424e79724b8c4b37a271b43d50629f9a91e4de8d813dbeec0e0d38"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
