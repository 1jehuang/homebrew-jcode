class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.67.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.67.0/jcode-macos-aarch64.tar.gz"
      sha256 "1036d98d470ad7ec160505f376b0622c93cee2961d3716e94b1a9ed9a98b591b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.67.0/jcode-macos-x86_64.tar.gz"
      sha256 "84e872a5b94c472c61dafae0077eb91426862832e06e58d91b8acd10f8700f98"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.67.0/jcode-linux-x86_64.tar.gz"
      sha256 "a4e57f88f21d40fee98b35293e16f59c83803758bd7c319f614dc6f193179013"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.67.0/jcode-linux-aarch64.tar.gz"
      sha256 "0e6b847290196ea114a1d3d62c39b27191d3886632ec74518199f0d244a582c0"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
