class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.25.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.25.1/jcode-macos-aarch64.tar.gz"
      sha256 "3dcc63165d4474cc013808eeb4c541639dd39446652b7b1f75891d03851e5fb3"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.25.1/jcode-macos-x86_64.tar.gz"
      sha256 "590d538af09f3eba8e6b2ff5556be6c0bba02c733e126db0dc85f25791d75436"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.25.1/jcode-linux-x86_64.tar.gz"
      sha256 "d5137eb32e711375438f6e5125a5154f1f1d6ce01890bf1a19cf309048509f9f"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.25.1/jcode-linux-aarch64.tar.gz"
      sha256 "a921623eb25fa6c47970f9a80cb454305fe03c2f756283f0665aca1c8204aa6c"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
