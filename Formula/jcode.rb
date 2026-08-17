class Jcode < Formula
  desc "AI coding agent powered by Claude and ChatGPT"
  homepage "https://github.com/1jehuang/jcode"
  version "0.77.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/1jehuang/jcode/releases/download/v0.77.1/jcode-macos-aarch64.tar.gz"
      sha256 "ee8aee33d775dea14ef1095c0bed6a046f52279bca4d24ca2de4f6e0598adb15"

      def install
        bin.install "jcode-macos-aarch64" => "jcode"
      end
    end

    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.77.1/jcode-macos-x86_64.tar.gz"
      sha256 "4b684aa1f93bef6d0285a74475daf5766980827b5ec4c86da203ba851855672f"

      def install
        bin.install "jcode-macos-x86_64" => "jcode"
      end
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/1jehuang/jcode/releases/download/v0.77.1/jcode-linux-x86_64.tar.gz"
      sha256 "0c426c643a5aac31345bda01662aa73d1f359d45a9a46e9cfd56dba43af0f279"

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
      url "https://github.com/1jehuang/jcode/releases/download/v0.77.1/jcode-linux-aarch64.tar.gz"
      sha256 "35d3da83c8436c52f965c2e4ee0416cb2ff3ee5f02586eeca51512b2760ebd57"

      def install
        bin.install "jcode-linux-aarch64" => "jcode"
      end
    end
  end

  test do
    assert_match "jcode", shell_output("#{bin}/jcode --version")
  end
end
