class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.3.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.1/jcode-macos-aarch64.tar.gz"
      sha256 "7a6a28ef8ad3db9cb72ccfbaea6965fb0a4df58467ddd36ae0e56cbe59fe752f"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.3.1/jcode-linux-x86_64.tar.gz"
      sha256 "1c60f1b99137464e5ebbf422f360ba23fec7df0a84dfb22a1dd6e2f7666d3467"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
