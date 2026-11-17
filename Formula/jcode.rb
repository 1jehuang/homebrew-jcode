class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v1.0.0/jcode-macos-aarch64.tar.gz"
      sha256 "1ac9a567ee76cc21efacae88ffd77eb3cac7e7d162b1d288d1b93ede3a767a76"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v1.0.0/jcode-macos-x86_64.tar.gz"
      sha256 "cf83af4f82eb524a46e3d7979f5fe0277c52571b5e30f04c2f5118147cbdf49b"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v1.0.0/jcode-linux-x86_64.tar.gz"
      sha256 "88e5a25ddb955afc89afd6122950f12085f792549556ff20710385790e5ef29d"

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
      url "https://github.com/1jehuang/jcode/releases/download/v1.0.0/jcode-linux-aarch64.tar.gz"
      sha256 "4fcdc8db49939ab59c8b0373e099eb1f2554a755301ab33e0d97baca22a342e4"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
