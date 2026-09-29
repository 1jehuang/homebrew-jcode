class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.89.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.2/jcode-macos-aarch64.tar.gz"
      sha256 "4ed5c4a3698f2ccb100634352574e52b7ad921232f0daef6d8061f95d60d58c8"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.2/jcode-macos-x86_64.tar.gz"
      sha256 "1e21fa6addc9d88899e80bf7e74335877158a261912f37e1740c9c3268009894"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.2/jcode-linux-x86_64.tar.gz"
      sha256 "9753618ab2b74755d43878a78dc54e65ea7be90f8c2e84d294e43ff890185237"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.2/jcode-linux-aarch64.tar.gz"
      sha256 "68e550b238c4fe566451ff9fdc0a4aa69a9280b8c92a3330c1cd72f0e8803cbc"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
