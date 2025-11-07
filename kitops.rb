class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.10.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.10.0/kitops-darwin-arm64.tar.gz"
      sha256 "74398a1c608448ca824a449008a61681ec6205c86eb4fdfe56190e17801d7095"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.10.0/kitops-darwin-x86_64.tar.gz"
      sha256 "11be2fb4d6b5c33bdb1250d9c76be5b2b92b4cfb0cd828b613360859d4a53299"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.10.0/kitops-linux-arm64.tar.gz"
      sha256 "9696eed1aa8d4c1b538e204bba3eb15b1189c2375ace813c5ce474c89469652a"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.10.0/kitops-linux-x86_64.tar.gz"
        sha256 "a4a5c75c1b518e3ac11ebeb195f66b17a1878954a0db63a40eaa6c02466e19d7"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.10.0/kitops-linux-i386.tar.gz"
        sha256 "17fd2e167e7d822fa9331b181ae5f79b84c3fd2101bdb77ce5195fec29d3375f"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.10.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
