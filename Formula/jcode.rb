class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.78.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.78.0/jcode-macos-aarch64.tar.gz"
      sha256 "c6dc7b9e7c0df77ddd4ec1654a3aa03aabf87fc07c7e0142fb6ab33bb2f4cb11"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.78.0/jcode-macos-x86_64.tar.gz"
      sha256 "a101d11d2993f06d74204c140f1e48e6ec1e00d3f3d730fa0a49ff92169f678d"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.78.0/jcode-linux-x86_64.tar.gz"
      sha256 "e28d4b746590b08a3cc4019d893dd53c5ec8f84885fe67035589c95f98ed2f3f"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"] unless Dir["libssl.so*", "libcrypto.so*"].empty?
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" "$@"
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.78.0/jcode-linux-aarch64.tar.gz"
      sha256 "1605de260d55f4597a7cea37b7d2bc985ee52872c4934d1b7f3f6c389d1117cc"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
