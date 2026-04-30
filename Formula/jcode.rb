class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.5/jcode-macos-aarch64.tar.gz"
      sha256 "5309c97c9518a40ce690613b4a5d3a421bdc3a8ac7552f8a9e4a6be951784a9f"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.5/jcode-linux-x86_64.tar.gz"
      sha256 "dbb4469f44415ca5012c930ec908c12610fe68babf744d01c31d897749cab4b0"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
