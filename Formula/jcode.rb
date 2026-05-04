class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.10/jcode-macos-aarch64.tar.gz"
      sha256 "62cb014b491fc9aca00142c86b59f2fd3f9f092825cd331c7de7d37d513a8869"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.10/jcode-macos-x86_64.tar.gz"
      sha256 "885661409f0f8476c89bf7a2b8a9b05ba22fd421896b7369eeb40d09154999e4"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.10/jcode-linux-x86_64.tar.gz"
      sha256 "0717a94d9435f195b1b97bcd91e008a0c26c8aebb93b6f364511dc573e8f4c30"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.10/jcode-linux-aarch64.tar.gz"
      sha256 "c32bbd1cbfead260b2b99a273d603e6d43ba40e06e55987654981f8ae9bf3b09"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
