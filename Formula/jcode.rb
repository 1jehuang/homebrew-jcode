class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.8.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.8.2/jcode-macos-aarch64.tar.gz"
      sha256 "cb862b045c6cd60ea9901653712a723d9b19c8daf3597f3fad20fc8330a27fb4"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.8.2/jcode-linux-x86_64.tar.gz"
      sha256 "488027d775371d58d2b301725ef0c94c89b436cf0fac80f827cdac31b7e2387a"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
