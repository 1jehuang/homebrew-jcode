class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.4/jcode-macos-aarch64.tar.gz"
      sha256 "12511e128e22d142c1019abd14f6759f23605f25a3b662f23724081db21e78b1"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.4/jcode-linux-x86_64.tar.gz"
      sha256 "ce46e557b02a9f93ac20fc1500c3d1ce2f57455840bcef5d6d941621baba6362"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
