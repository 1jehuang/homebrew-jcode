class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.64.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.2/jcode-macos-aarch64.tar.gz"
      sha256 "abe94a2e0c7716d51252334619675f89af7c78ca391fc811fbe49df0ed5c3bfd"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.2/jcode-macos-x86_64.tar.gz"
      sha256 "f753c5f37e0d8fdb39b1a10c82e6d6a8760ed43c6152a6f02c66c165a992094c"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.2/jcode-linux-x86_64.tar.gz"
      sha256 "9f31c88c7993d8403f8511a9f1eb87502c6399ac451b6af9d37f419a42099a06"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.64.2/jcode-linux-aarch64.tar.gz"
      sha256 "8d42ee84118211ad23196c0afd126e0dfe14c3018b96055a39da7a7460a0be4a"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
