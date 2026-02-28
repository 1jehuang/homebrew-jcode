class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.2/jcode-macos-aarch64.tar.gz"
      sha256 "cbea99cdabb43c8f12617db0156b2feb3e1a121feaa347edfc65fe73b7bef321"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.2/jcode-linux-x86_64.tar.gz"
      sha256 "59a5b41e13d1a5719284d63085366bc43b0cb81c46cce0bea907f81bf0e4b744"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
