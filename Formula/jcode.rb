class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.8.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.8.4/jcode-macos-aarch64.tar.gz"
      sha256 "533f89214defb30eb2b7e7a0f2fb9ad83642f3a7c897f756b613e55e7f5a84c8"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.8.4/jcode-linux-x86_64.tar.gz"
      sha256 "dfb201822d535469782861353ded6f31be57726df75bd80a1c0ca0257cccf523"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
