class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.5/jcode-macos-aarch64.tar.gz"
      sha256 "8b810f79fe2447838bf5f7f115998047b12a0e2ff10213541452d479a9bb6379"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.5/jcode-linux-x86_64.tar.gz"
      sha256 "cb98cf0785052fdef3c124f653a9b7c1e6528a3be218c52ddc37c31bcd8c5fea"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
