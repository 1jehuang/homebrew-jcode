class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.1/jcode-macos-aarch64.tar.gz"
      sha256 "f9fabeb53ce1263a22502e996270a53f1a66d1c27f1d708baaec5e84fbac114b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.7.1/jcode-linux-x86_64.tar.gz"
      sha256 "d36d1a2bd3b4927a9c65b243948c7959d32d1cc964d3525e0146ef30f333149c"

      def install
        bin.install "jcode-linux-x86_64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
