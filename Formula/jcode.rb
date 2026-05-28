class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.14.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.4/jcode-macos-aarch64.tar.gz"
      sha256 "01b787fb33c8021c2ecb7a174dd6680f4970fa3a9f7d0ad7deb997e22c40b06f"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.4/jcode-macos-x86_64.tar.gz"
      sha256 "5c066ba3d9549130a0722dd036a4ac3b866ae6208e907df172fb298824dfde7b"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.4/jcode-linux-x86_64.tar.gz"
      sha256 "a1a314cab5707d6808125f2ce26e5b0a9ab518eaaf5f1ce750f094bd46cebd25"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"]
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" ""
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.4/jcode-linux-aarch64.tar.gz"
      sha256 "e2369935ef3242b02b6607a25f600ac3d871c0956e3fd721eafc8d0370a02872"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
