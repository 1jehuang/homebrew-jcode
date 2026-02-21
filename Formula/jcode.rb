class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.3.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.3/jcode-macos-aarch64.tar.gz"
      sha256 "185f5cbbb924d0e7b3f43af0cc5eaf05bc86e24621291834aed8f18c2b9f2c25"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.3/jcode-linux-x86_64.tar.gz"
      sha256 "60f6cef0afb9211a980f7bf56c5f51c4855e4eb8c3aa520199b57fa471a370a0"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
