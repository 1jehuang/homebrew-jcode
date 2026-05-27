class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.0/jcode-macos-aarch64.tar.gz"
      sha256 "7f554a20728aa47735a02f0d568f89071a339062608a4c4dfa1bd58bc679ae06"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.0/jcode-macos-x86_64.tar.gz"
      sha256 "678858aee0df88afe02fe408b93312e2305b6f958dff27c2ec0e5669b74f959c"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.0/jcode-linux-x86_64.tar.gz"
      sha256 "43ac50a926fff21c750ea1d919ee9396551af6e1688303aa41e75cbd29920618"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.0/jcode-linux-aarch64.tar.gz"
      sha256 "7db9fc2a9052e31d3fd24482cc9c1588db8f5bbec96081e04ec783f91d4db723"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
