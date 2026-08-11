class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.75.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.1/jcode-macos-aarch64.tar.gz"
      sha256 "e4c0feee17738a3c1b978432461d9a677bec823eed409c6f8c300d3d49d57e16"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.1/jcode-macos-x86_64.tar.gz"
      sha256 "aea33a475c8ecf76330fd55bfbe6d618e334b5bf14a6479ea91d15b2a02e1edf"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.1/jcode-linux-x86_64.tar.gz"
      sha256 "c6ca1f7da4acb8f9fa3d8cc0160eda463d7aaea926e3bf47ab9b2a0aca5f61ae"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.1/jcode-linux-aarch64.tar.gz"
      sha256 "3efb27292379a5486d1ade2e7dd5fef6356f047c922e42fbb4a106932ab27dd4"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
