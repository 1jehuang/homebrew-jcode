class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.34.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.34.0/jcode-macos-aarch64.tar.gz"
      sha256 "bfddb4810d76928c568ea3bc461c877204ae0419cf9d2c7b5fd28072ceedec66"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.34.0/jcode-macos-x86_64.tar.gz"
      sha256 "52db1dcd1e79f88db3dca48f0bb744f0700a6078c97daf4b7905283685a6e2e4"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.34.0/jcode-linux-x86_64.tar.gz"
      sha256 "02c1ee62cb9fb42c4847962e76c678ea89f545d7d7e661851eb51139e8240ea1"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.34.0/jcode-linux-aarch64.tar.gz"
      sha256 "b6565e3caf8bd07e0114986a6bc11b52a7dbfa6d340f43e00e7ecb445d3fecdd"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
