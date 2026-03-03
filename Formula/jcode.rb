class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.8/jcode-macos-aarch64.tar.gz"
      sha256 "83d234043ad2be62d50e6340ff717e12b0c43e2feadfa2dc3570cb0dda6493f4"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.8/jcode-linux-x86_64.tar.gz"
      sha256 "376d2597d89797bdf0c4ca55df7c20ba2e9439bdab86d77d0a9aec2c5c884aa9"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
