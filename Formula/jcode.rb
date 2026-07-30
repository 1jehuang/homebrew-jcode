class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.62.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.62.0/jcode-macos-aarch64.tar.gz"
      sha256 "e474363293ec0191de9717275f017561b269c81fc8f199c87fcfbba0952a23d2"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.62.0/jcode-macos-x86_64.tar.gz"
      sha256 "8cdfbeed67bd38d98431b67a9db5e840affea9050a7cca20926c58036edc41fc"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.62.0/jcode-linux-x86_64.tar.gz"
      sha256 "90f596d67d0996978f4693aac478376379bb6310b86653a146e4667ac9c2f550"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.62.0/jcode-linux-aarch64.tar.gz"
      sha256 "a8472d47bfbe58841fddf3d644f0077b9fcf5f3ecdefa55c152f73890e8a1dd7"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
