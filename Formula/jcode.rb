class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.7.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.3/jcode-macos-aarch64.tar.gz"
      sha256 "fa3d2a9745d9de93dc28b10d079673aad45c3927ede3bac0dfc05b23917ff343"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.3/jcode-linux-x86_64.tar.gz"
      sha256 "bd09b03791aeb994bf635de8227c3cfa7f71cc8406085d42bc289f790c417664"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
