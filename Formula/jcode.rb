class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.61.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.61.0/jcode-macos-aarch64.tar.gz"
      sha256 "b0c87b6aad07c27d40cadcc426665e3ed07fb924e3e632fb961568443029491b"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.61.0/jcode-macos-x86_64.tar.gz"
      sha256 "9e6f9dd1b499d23e5790e85a227ec06bd13ddc165dbef9dda146a3cbe26ce942"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.61.0/jcode-linux-x86_64.tar.gz"
      sha256 "5992df2c4eff996c59fbc6da7334bb7596f9d964fa821e9df676c4627cc12a2b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.61.0/jcode-linux-aarch64.tar.gz"
      sha256 "fc01dd0d39554062c9a67ac350080a4c7a1cceee18c4325587e89a7a3b3d7a24"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
