class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.13.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.13.0/kitops-darwin-arm64.tar.gz"
      sha256 "cd370ed2596d0e7f4c2d107b09a9a2fd6f22f8c1ff94c95514c9e27259171a85"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.13.0/kitops-darwin-x86_64.tar.gz"
      sha256 "682f6607eaacdfd560fcf24c6abf3f561701da92e6c4d8d7ce0e8c9f83897762"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.13.0/kitops-linux-arm64.tar.gz"
      sha256 "344adbd24d9b53115759ccb7007d2d3fd04b719f467475c124a516d79ac68972"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.13.0/kitops-linux-x86_64.tar.gz"
        sha256 "91840af8a28ad4e1a2755b50dc1b35f04dcfd916df3bee911bee26c584591e55"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.13.0/kitops-linux-i386.tar.gz"
        sha256 "19d49d09b43097bd57feb76baa3d9c4b5206405cbfe5b0cd9eed714df6b9bf5f"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.13.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
