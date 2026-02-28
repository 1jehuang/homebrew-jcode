class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.5.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.1/jcode-macos-aarch64.tar.gz"
      sha256 "52e77f7d418c104fbb348407ecfbc77e8c166b24b80e8c6c3c9b840a6f93d928"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.5.1/jcode-linux-x86_64.tar.gz"
      sha256 "8af4fa95ecfe3a74ec376af01a5a582cf510535c7dab5cb3af521204fd4c88c6"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
