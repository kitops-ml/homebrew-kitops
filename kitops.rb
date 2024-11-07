class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v0.4.0/kitops-darwin-arm64.tar.gz"
      sha256 "336b94abcde444899c462392160b674de6afce2c3a6121c36e022f0c5bdc596c"
    end
    on_intel do
      url "https://github.com/jozu-ai/kitops/releases/download/v0.4.0/kitops-darwin-x86_64.tar.gz"
      sha256 "b7d061e78c954df5de4ff99210490f889b9027e0a9ff4d83cd6cbf4672080f66"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v0.4.0/kitops-linux-arm64.tar.gz"
      sha256 "e1b90d26ca2a4339715b4ad8861869e680636f77f06b1e18e418cd2132b340ab"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jozu-ai/kitops/releases/download/v0.4.0/kitops-linux-x86_64.tar.gz"
        sha256 "08bcf8d60fea2dcbea2d8b4bd9c1f0047e390dab9115681a553445189733ce31"
      else
        url "https://github.com/jozu-ai/kitops/releases/download/v0.4.0/kitops-linux-i386.tar.gz"
        sha256 "db2bf42a88329ba31d542eb332d064a9ad2518206ea19deb0271b804a1aa667b"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 0.4.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
