class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.89.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.3/jcode-macos-aarch64.tar.gz"
      sha256 "c83c678a61e0aeed6a45b3a4f762dc18ffc0f62ca4465c12dd6a5253513b5be7"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.3/jcode-macos-x86_64.tar.gz"
      sha256 "3df561c881aeee73e3b1d4647c227fbcb60dcc91d3efeea669967bcad1199414"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.3/jcode-linux-x86_64.tar.gz"
      sha256 "656f0d4b95210e5b880107b5ae6d93d176884e452030cede71e5e64e051e40c9"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.89.3/jcode-linux-aarch64.tar.gz"
      sha256 "3a9b271a6ceff583f7c024ebbee1adcf547aaab97d72e5a2b0716c3c323c11ef"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
