class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.9.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.6/jcode-macos-aarch64.tar.gz"
      sha256 "c3ea7e9da24da04b9fd69f534dcb2484b33274b9f3f6e13ce6da80edc188cf4e"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.6/jcode-linux-x86_64.tar.gz"
      sha256 "8d137644c5b1bc65a8d344952474a1c3b28a5eabbbf21fe9b932774bc0c07b50"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
