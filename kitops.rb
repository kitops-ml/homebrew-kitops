class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.2.0/kitops-darwin-arm64.tar.gz"
      sha256 "d2e8bb2b9d1a81599e6196d43e3bf530ee511b2cce17a8f6b7718bdff07e438f"
    end
    on_intel do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.2.0/kitops-darwin-x86_64.tar.gz"
      sha256 "79e5ae7ad6a023f0ba4efd09d1aaec8b66c43e1ccccc8417188dd41159abe2c5"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.2.0/kitops-linux-arm64.tar.gz"
      sha256 "7af9d6d7d0ce53ad8805281fd46d565263e5bf2de54499c1f68442195504ae3b"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jozu-ai/kitops/releases/download/v1.2.0/kitops-linux-x86_64.tar.gz"
        sha256 "7e5df95deb4b7a531b451c44eb8c25a285ff25f48504446ca8021a2a0c38565d"
      else
        url "https://github.com/jozu-ai/kitops/releases/download/v1.2.0/kitops-linux-i386.tar.gz"
        sha256 "d22f4fdfee46136f3587845dcbe9bd255b5c239b7d92e9057679e590cf14fa03"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.2.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
