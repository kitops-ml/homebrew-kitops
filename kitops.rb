class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"
  version "1.4.0"
 
  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.4.0/kitops-darwin-arm64.tar.gz"
      sha256 "22d874daa2380cbd9065a6ab88d7e17872622dae9e669c2629cf19aae313d540"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.4.0/kitops-darwin-x86_64.tar.gz"
      sha256 "f1dd0b1622d349aa98a67fb70af160932d9aa40f6b433f1fef5735f29a8a01ea"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.4.0/kitops-linux-arm64.tar.gz"
      sha256 "b25f894c9cf6dc329877c060b4812c4bd066869e91c301d52a18e5bc86bc6138"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.4.0/kitops-linux-x86_64.tar.gz"
        sha256 "5ae2a23d26884a52e9f8c756a21de0fbd460bc020e6eed1e98af1e0c193b626a"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.4.0/kitops-linux-i386.tar.gz"
        sha256 "2c942f75a2bfde63005617dab82f84ac163f3fe71aff19c7b4406075f645ce50"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.4.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
