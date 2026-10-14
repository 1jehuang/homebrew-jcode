class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.96.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.96.0/jcode-macos-aarch64.tar.gz"
      sha256 "9153d1be336234ae81b5ed33cfad496f04efce9ddf5d99975093ea0f45059ea5"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.96.0/jcode-macos-x86_64.tar.gz"
      sha256 "aaad137ce5913730f8309d6668d96cb2b73765f3bd4d9c501015a96a63676e6c"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.96.0/jcode-linux-x86_64.tar.gz"
      sha256 "2808a7cc0a05e011f8cec8b841c359fa88f30d517987282da24c8438afb38407"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.96.0/jcode-linux-aarch64.tar.gz"
      sha256 "2b3766c5e7c042a654cd1655652512bd8a1575b80587972f5ddd23020537079f"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
