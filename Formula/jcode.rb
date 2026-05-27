class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.14.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.3/jcode-macos-aarch64.tar.gz"
      sha256 "efe35228164ce858b5e31868b2f6aabb7d90647df0940c962521b13e8a717d74"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.3/jcode-macos-x86_64.tar.gz"
      sha256 "da50b928baa455fabdce082c80ef6e84f814f6bec9c8c03ec0c99f92bfa01b63"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.3/jcode-linux-x86_64.tar.gz"
      sha256 "329eb51a74c1b94b95f2f109959a4590c68a95b785911741e21f2aefcfa30905"

      def install
        libexec.install "jcode-linux-x86_64", "jcode-linux-x86_64.bin"
        libexec.install Dir["libssl.so*"], Dir["libcrypto.so*"]
        (bin/"jcode").write <<~SH
#!/bin/sh
exec "#{libexec}/jcode-linux-x86_64" ""
        SH
      end
    end

    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.14.3/jcode-linux-aarch64.tar.gz"
      sha256 "c7d45d756d260616e5e59832056e3271380e96e98fdac47ada0b5ae5aef41dd6"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
