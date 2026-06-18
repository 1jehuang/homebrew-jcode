class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.30.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.0/jcode-macos-aarch64.tar.gz"
      sha256 "7546783965860c23557aa8ab10889c900eff4ddb722c21466790131fdb7ba082"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.0/jcode-macos-x86_64.tar.gz"
      sha256 "dac850b9668d6cb2ddf55f09b7cfcfc53dc1f1d45bcb9c9439f39b09df35bbb1"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.0/jcode-linux-x86_64.tar.gz"
      sha256 "5690b98cc5fdbe02e9a52fa4f9f2ef287a4f1e38047b48af5e1cf1cd400cbd24"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.30.0/jcode-linux-aarch64.tar.gz"
      sha256 "08e48355582c2ad59540c8db4c02874871d29aa6e287ccd1fd659019805aa973"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
