class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.3/jcode-macos-aarch64.tar.gz"
      sha256 "21488cddb8e5a8921a836b09555216a81cf334d44e70567f7c92e48b9250fcb7"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.3/jcode-linux-x86_64.tar.gz"
      sha256 "34689aec4b034e9d533fd41b83f5abcff26860a383efcda558da83464a0fbbb4"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
