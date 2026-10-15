class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.98.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.98.1/jcode-macos-aarch64.tar.gz"
      sha256 "8c818e574576706118e74834555c39fc0cd5966dcc95c95faada84f90de932fc"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.98.1/jcode-macos-x86_64.tar.gz"
      sha256 "45a4edfbecdd9eb4f0cd59574391dfabf39ee40ebb596b1b5ca21e4d8fc2ea0d"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.98.1/jcode-linux-x86_64.tar.gz"
      sha256 "449a8ed50aa9ac75e6afe9b8e916814172ff7cc63913c7ae1f9abd5b1bc5323c"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"] unless Dir["libssl.so*", "libcrypto.so*"].empty?
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" "$@"
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.98.1/jcode-linux-aarch64.tar.gz"
      sha256 "571917f4029b2f72c4045423871c40f30f93064f9938eb9f1910ea8f14797100"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
