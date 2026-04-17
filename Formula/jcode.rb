class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.10.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.10.2/jcode-macos-aarch64.tar.gz"
      sha256 "d10a7caa0cb3488952c7a835bd14d9e306f055a421f43275572163843131d769"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.10.2/jcode-linux-x86_64.tar.gz"
      sha256 "7d3b4c5b374dcb20ffb59eee9ad45a8d31f9a0cc2c78f4d26b3476c8ed1fc1cc"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
