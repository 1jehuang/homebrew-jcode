class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.13.0/jcode-macos-aarch64.tar.gz"
      sha256 "8deb14caf28a38ec433ec323a1e75bee6d9730a19d768ce71fe7ec6b83cb8dce"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.13.0/jcode-macos-x86_64.tar.gz"
      sha256 "052639a8125b0256188b33f9568b958291c56587f3a2d7be2cb9e25184e8c62b"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.13.0/jcode-linux-x86_64.tar.gz"
      sha256 "aa53838dd0014e368f55dd8dd4bd2a092d60dbe2bf451560ed00b18d0a298022"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"]
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" "\$@"
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.13.0/jcode-linux-aarch64.tar.gz"
      sha256 "6a3ba82a0bd958586eca58ef5f6d1f619322d51c25c52e3cb2903745ab574315"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
