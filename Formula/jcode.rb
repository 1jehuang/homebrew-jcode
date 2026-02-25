class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.4.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.4.2/jcode-macos-aarch64.tar.gz"
      sha256 "a4d867ecb1fab5f19c841632a64e46a50913eb2c9084ab892017cbc3e0767c39"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.4.2/jcode-linux-x86_64.tar.gz"
      sha256 "1d8728870eaf24f9d83c929e7ee0203dbacd92c10a983ea84c6ad24c2acc0377"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
