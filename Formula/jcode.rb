class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.30.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.2/jcode-macos-aarch64.tar.gz"
      sha256 "d0451a3acdcd77ddee6a7a55aca7dba5f45cb9b3c6be2a216e65548fa0fe1ec2"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.2/jcode-macos-x86_64.tar.gz"
      sha256 "0465f5ec5a2ee05db6bb6b87665c337c87b1033a4b7c5ad8e048f95ed2fb33ea"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.2/jcode-linux-x86_64.tar.gz"
      sha256 "4b9657585874cd2adc0c7cc646fc4d24916c531cb9031bf90a034dcbebbb3170"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.2/jcode-linux-aarch64.tar.gz"
      sha256 "417a67a0f2f5a477a7f750df1648f1f2a28068f10285e3815cd15b782e8e9443"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
