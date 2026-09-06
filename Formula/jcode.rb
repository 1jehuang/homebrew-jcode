class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.83.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.83.0/jcode-macos-aarch64.tar.gz"
      sha256 "69743c26d2fbdaf85048bca5dea3a0a7a89a780d567f65928bf81f665ce12b66"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.83.0/jcode-macos-x86_64.tar.gz"
      sha256 "625e90d442561cfc37c92a2469f1b6c05ba2a04f03c16df533e65e6dc66f3d3e"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.83.0/jcode-linux-x86_64.tar.gz"
      sha256 "5eeb9eedf5f979d1becc1bceea78ced1f5d89f9e7a6927ad1bda5be1303c0388"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.83.0/jcode-linux-aarch64.tar.gz"
      sha256 "b5f37a4fac001d77a77444aa53e14e83a27c23a26a31f357db18ecd602b9f497"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
