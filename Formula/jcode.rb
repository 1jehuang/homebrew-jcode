class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.50.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.50.0/jcode-macos-aarch64.tar.gz"
      sha256 "10ef78d168632a449cf8479b9f35b3c86ae037d30fd07820f97112fa0bf8bd03"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.50.0/jcode-macos-x86_64.tar.gz"
      sha256 "162ca6db700ded09ed938f88461db00be91c55c10f38c6365bd3b1b8b12d1be5"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.50.0/jcode-linux-x86_64.tar.gz"
      sha256 "6c976d5f1d5bff4d65b75aa7f36cef279419e06f5afd01ff8f33cb4d4059ae90"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.50.0/jcode-linux-aarch64.tar.gz"
      sha256 "0fe0a02fad369babb9c8bbcf8cc53b07815d996fd42a8a979cdfa689972e195a"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
