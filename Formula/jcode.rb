class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.13"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.13/jcode-macos-aarch64.tar.gz"
      sha256 "e8d2ab2ccb3b3c024c56e2bfa490750f349b2981d1b8370839c8483736813f91"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.13/jcode-macos-x86_64.tar.gz"
      sha256 "0d1871f4912961c491a1c7cbd06c177de05d0911aa9ba27de82a13e91e503f48"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.13/jcode-linux-x86_64.tar.gz"
      sha256 "447e52a277511494879d10c371570d162fda6df10fe7cd268b22e2cf06c3c6e1"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.13/jcode-linux-aarch64.tar.gz"
      sha256 "718ff906b2e7602b999b219758435852ae979d497b7d4d8fbdec9ff3086cbee9"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
