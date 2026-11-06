class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.17.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.17.0/kitops-darwin-arm64.tar.gz"
      sha256 "a7aef75cf93ab3bfd751a984acbb069e7fd00c34351f558c44f2aad52c8d3a25"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.17.0/kitops-darwin-x86_64.tar.gz"
      sha256 "dd784752c7fe0783021c31b3ab37dc917ee18e986491e98b976cd267efa0213a"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.17.0/kitops-linux-arm64.tar.gz"
      sha256 "06f18aefe6139855570608db82f430e7f9b329697552efc04b29386c18f77b11"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.17.0/kitops-linux-x86_64.tar.gz"
        sha256 "43e739d5a101db9994a6c539c41aacbdde9d368794c75f0623b5b4eaff12c3e2"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.17.0/kitops-linux-i386.tar.gz"
        sha256 "6289d2b7ca322f91c770674fc5b4578b496fb46d969f75c22dddddf4fab6ed0e"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.17.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
