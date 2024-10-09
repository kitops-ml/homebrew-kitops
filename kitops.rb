class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/v0.4.9/kitops-darwin-arm64.tar.gz"
      sha256 "3bb9e1c985e83b21437e6f409b0f3f6a6756a4f4768c165c53521346d85e22a0"
    end
    on_intel do
      url "https://github.com/brett-hodges/kitops/releases/download/v0.4.9/kitops-darwin-x86_64.tar.gz"
      sha256 "84cc47b4374a32a8ccdc5d1c2c33bd69181ecc943ca93033c6611fbefd2215d8"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/brett-hodges/kitops/releases/download/v0.4.9/kitops-linux-arm64.tar.gz"
      sha256 "3a55f63dfaa8b3df5d11784c96e662c6f22aaf6a3985e13d6bd01db2e27385de"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/brett-hodges/kitops/releases/download/v0.4.9/kitops-linux-x86_64.tar.gz"
        sha256 "d4d2b252b318220b6977508eb46e287ec3050fd3be41c09e2ed0b34a4c393833"
      else
        url "https://github.com/brett-hodges/kitops/releases/download/v0.4.9/kitops-linux-i386.tar.gz"
        sha256 "492e46886d6c25547a04efe3ba321bab6aae13188426519a0ca552000091043f"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 0.4.9"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
