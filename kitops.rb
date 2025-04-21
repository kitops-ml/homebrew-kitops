class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"
  version "1.5.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.5.0/kitops-darwin-arm64.tar.gz"
      sha256 "ffafd3f7decb5895ef34e8619ed2af8a329cdf2633b4d8c65ba708e502c6714e"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.5.0/kitops-darwin-x86_64.tar.gz"
      sha256 "6aed63e35000537b12dea00396657e574db1d590bf1abeec548be935a68474ee"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.5.0/kitops-linux-arm64.tar.gz"
      sha256 "08be435d3492f56dfa5c8e979a6251f0630574b49e1dec6d2309089bbdc8eb2a"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.5.0/kitops-linux-x86_64.tar.gz"
        sha256 "a303d6874f9b809869341a7e4803db3afca6ed8f81463e071b055fd579bdb1ea"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.5.0/kitops-linux-i386.tar.gz"
        sha256 "d655204f6ecb833eef6d894f56a582cc394ecdf6cb11c64e0093abc977d0631e"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.5.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
