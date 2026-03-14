class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.0/jcode-macos-aarch64.tar.gz"
      sha256 "4b5f02fcd270448e19f1b0d50efbb91e1185e661f64685841fddb25514fae88d"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.0/jcode-linux-x86_64.tar.gz"
      sha256 "8eb919714ee8f71ad44bb4b65b9f7e1482820d4d6b088b1d41fe7f3272701406"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
