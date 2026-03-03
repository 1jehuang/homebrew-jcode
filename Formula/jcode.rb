class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.10/jcode-macos-aarch64.tar.gz"
      sha256 "a6c3e5425458af0af1a84a26c94dba8055ee5bf36fad7d4089bb3336ccea9980"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.10/jcode-linux-x86_64.tar.gz"
      sha256 "b43b006b42f1d0c79332f4c30105496c82e66cc3555f21496221f6b4b69d2489"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
