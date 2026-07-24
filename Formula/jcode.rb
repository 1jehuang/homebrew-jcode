class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.56.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.56.0/jcode-macos-aarch64.tar.gz"
      sha256 "fb8e936fb77b981560fbb4e395cd5a00a25983946a5b2a6b40f92cbdaf267e7c"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.56.0/jcode-macos-x86_64.tar.gz"
      sha256 "e3053112f834015340d765647b944bcee9f8efa34edc5b40e22f5645faa43d82"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.56.0/jcode-linux-x86_64.tar.gz"
      sha256 "d91190667162be797a22f126c59fdef33d7b091638424f76eebf640bb7261c6b"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.56.0/jcode-linux-aarch64.tar.gz"
      sha256 "d5510ade39f9a049b47dfffed814a7c542ed02dd70399ccf87ee8bce76abc155"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
