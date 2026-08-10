class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.75.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.0/jcode-macos-aarch64.tar.gz"
      sha256 "fcf9c518274e5548d3ea01b0f23005ae84cbd7311638b5eb8c8c17e2a32d5f36"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.0/jcode-macos-x86_64.tar.gz"
      sha256 "c109113dca067d9a5cb7557d89576a9fc3c2e18d3e497eb16c6a5a74e20c7bc5"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.0/jcode-linux-x86_64.tar.gz"
      sha256 "9c11d667b8aee6ffb51e12f7781d1eccc8a337de4295d7a330acf534b34bb139"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.75.0/jcode-linux-aarch64.tar.gz"
      sha256 "cf149bbc760f50780b5348ab2f4d9e3ed05f669f00c44edc6e931f2f51558b3c"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
