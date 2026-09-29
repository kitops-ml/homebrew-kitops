class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.16.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.16.0/kitops-darwin-arm64.tar.gz"
      sha256 "409faf7a63967bf02fdca50c905226847b974c344869025c92eb55539544279d"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.16.0/kitops-darwin-x86_64.tar.gz"
      sha256 "8f391bc0c5d9ec7c3d895f86167c2cf176c178ed4e62141083dc1d545cb9b4ab"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.16.0/kitops-linux-arm64.tar.gz"
      sha256 "1d6ff3183e6c866c05756461821807c618d6cd23ecc7d3631ad998e6eea1cc18"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.16.0/kitops-linux-x86_64.tar.gz"
        sha256 "de8bf68fcc037fd673eabbdc79ecb8e8418e9ab3cbbb6eaba3785ff07dc655ed"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.16.0/kitops-linux-i386.tar.gz"
        sha256 "ae75fa20d603a329896432b4956633d47f05d5c40108ec868e1418537ea1e3a4"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.16.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
