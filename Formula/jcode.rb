class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.11"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.11/jcode-macos-aarch64.tar.gz"
      sha256 "ab1c8d5073461fabd2a262228a9d5d884dc20f46097888cbcd12457c65a95e7d"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.11/jcode-linux-x86_64.tar.gz"
      sha256 "4a091e4d42087ecbb8c01dcb7c947eac4470888f74bc9fca935c1aadef12b0f5"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
