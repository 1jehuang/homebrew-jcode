class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.10.3/jcode-macos-aarch64.tar.gz"
      sha256 "7af0f123e1f719211ba0b9eb56a6677102364f06ff2f1c4f726f396aea033828"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.10.3/jcode-linux-x86_64.tar.gz"
      sha256 "d266f454ccb5c084ccb7fa19b5202805273ff954e9a20eab88cb7548e51895ba"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
