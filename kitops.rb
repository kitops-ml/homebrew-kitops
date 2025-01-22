class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.0.0/kitops-darwin-arm64.tar.gz"
      sha256 "f2d35f0be3f0331ecc54c9a27e13656012c6ab263f3c9695f3a079c4517d2f87"
    end
    on_intel do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.0.0/kitops-darwin-x86_64.tar.gz"
      sha256 "85ebfa851cf8b6ffe0f57618620095ca69038e5f65bf25a4e48e8e941f33e783"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.0.0/kitops-linux-arm64.tar.gz"
      sha256 "f9d4090a9b5074e3197ee6f738046273fcf8d5a5773ff5837fcb349a5e866ebf"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jozu-ai/kitops/releases/download/v1.0.0/kitops-linux-x86_64.tar.gz"
        sha256 "abfe6a5633a74587dd87be5c4a0564152be39cfdba1dadb8391cfa8332a93c80"
      else
        url "https://github.com/jozu-ai/kitops/releases/download/v1.0.0/kitops-linux-i386.tar.gz"
        sha256 "e4d15f599bfc3b44bfba7f5662ec4865d7298eaff5e5d8e0c8bfc118bbd08994"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.0.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
