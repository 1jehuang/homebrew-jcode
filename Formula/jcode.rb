class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.7.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.8/jcode-macos-aarch64.tar.gz"
      sha256 "95a14481cacd0c98e9389431d7618d21a11ca1777966d652a7f40eed165b795d"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.8/jcode-linux-x86_64.tar.gz"
      sha256 "2359496f8fcc97a0bd5cf2444339ddba7d8c65549f8e41799f8c6a8ab5a4c4c4"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
