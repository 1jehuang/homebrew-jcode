class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.30.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.3/jcode-macos-aarch64.tar.gz"
      sha256 "3eb7a14c5b32e24c5557e36b9248e9c5a44094c631d13d78ce630d59aa6f6c54"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.3/jcode-macos-x86_64.tar.gz"
      sha256 "c4aa90cadf5d20e046d3bdb8fc056c0d3d30d35f9c18e185dafd99c34a09ebd2"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.3/jcode-linux-x86_64.tar.gz"
      sha256 "6a6c7c9dba36f5c5bbf2f80cb9e111c1be5d9f323d1a7fb14c333b3dbbae0adc"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"] unless Dir["libssl.so*", "libcrypto.so*"].empty?
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" ""
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.3/jcode-linux-aarch64.tar.gz"
      sha256 "b37d946321a6a9df406499f8ec637ca86b5700e92756b7b763f74850daa97eab"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
