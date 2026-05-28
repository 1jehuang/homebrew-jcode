class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.14.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.5/jcode-macos-aarch64.tar.gz"
      sha256 "2ba9ad9a895ec1844a22ea660d42d1e53fa34b1d6488c1743dd1af7138d86331"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.5/jcode-macos-x86_64.tar.gz"
      sha256 "11419f71c89aa2641c877e2a2bb09d74186c5dc5b20be732011c277e6a15a38a"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.5/jcode-linux-x86_64.tar.gz"
      sha256 "0f8777833abdb8fc37c630666be040fc04e248168175b258dc283b4418b1152b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.5/jcode-linux-aarch64.tar.gz"
      sha256 "8d7eeb790f07aa52d690515bbf35bc8f2515207c202440057de3adc818fc72ff"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
