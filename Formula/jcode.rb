class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.53.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.53.0/jcode-macos-aarch64.tar.gz"
      sha256 "b1515686c15b79720e912d7e870dcf4ee5c517251ae3247c2a70e572ad22c3cb"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.53.0/jcode-macos-x86_64.tar.gz"
      sha256 "89c4a3117db2b0b775b4f73972989d600641954383edca190810f2cdeec9eddb"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.53.0/jcode-linux-x86_64.tar.gz"
      sha256 "60e1b8fca8b0e528c6405f0530b8e311124bb634c9e9f6a65882cfc4ed9fb680"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.53.0/jcode-linux-aarch64.tar.gz"
      sha256 "a5a3f75e81007a1ae7e1216d816d42f98b04baf667dad2545c50337b4561157a"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
