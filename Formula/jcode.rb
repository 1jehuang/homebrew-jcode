class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.11.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.6/jcode-macos-aarch64.tar.gz"
      sha256 "bc10bbf971cfc778fd6fe5fe93163dbfc1160193567dd9ed3278cf6ff90122e4"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.11.6/jcode-linux-x86_64.tar.gz"
      sha256 "52b46fc5fea0b92e9179dec9cf7ed240ff4f44aad4940fdb9023e88b1710bc28"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
