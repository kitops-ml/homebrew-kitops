class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.3.0/kitops-darwin-arm64.tar.gz"
      sha256 "ce24802d6039dbda83773ec4d12b5e06c9cab075b8e04874dcbb519e09212166"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.3.0/kitops-darwin-x86_64.tar.gz"
      sha256 "4176bfafc33a75a5e4bde1a23a23e4c2e4d8c52092d4cd2da5810fc0df9faef7"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.3.0/kitops-linux-arm64.tar.gz"
      sha256 "2303aded7ab17075cec743b03e166190c1556c15a7bfe343b30566d09e5abad0"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.3.0/kitops-linux-x86_64.tar.gz"
        sha256 "7d72b260d90336af36b4570933796ff9fc3bd6ed2602c7ac14dc860f52ab653b"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.3.0/kitops-linux-i386.tar.gz"
        sha256 "4861d2136e9e15614231909ed6e676c4333045c98a1083e7b350fca4c1aa71a9"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.3.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
