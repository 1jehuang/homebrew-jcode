class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.9.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.4/jcode-macos-aarch64.tar.gz"
      sha256 "5c6d834646acbede19755665dd9943b2c3397b373bd6d46fc4bf470a57f171a2"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.9.4/jcode-linux-x86_64.tar.gz"
      sha256 "608cc98dc2cb07df38c5b43b66c291e547315eb3c56d8a6deed13f189a15b945"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
