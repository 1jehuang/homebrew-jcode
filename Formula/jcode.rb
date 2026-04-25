class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.10.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.10.3/jcode-macos-aarch64.tar.gz"
      sha256 "8a08579748487c5884580484f0c12aa9403bc402625b90655966da599c41d870"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.10.3/jcode-linux-x86_64.tar.gz"
      sha256 "5a14c8c8d32f20766b0ece1d5622c75ddc09203a5da0ace1a4d9a75133b3c7b6"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
