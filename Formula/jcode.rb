class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.4/jcode-macos-aarch64.tar.gz"
      sha256 "04b3752b52bc754ec91b44b7cd36028d5522bc892f3ea6522fc948fc0c9729f4"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.4/jcode-linux-x86_64.tar.gz"
      sha256 "72a3342711e34a1c9717cf31dc2916f92708821e2c86bd84e47d702ec4ad68d3"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
