class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.11.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.11.0/kitops-darwin-arm64.tar.gz"
      sha256 "8d878078024632844be38ff36d78d5fe6f95b4955e84e068ef06d96d09db13ab"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.11.0/kitops-darwin-x86_64.tar.gz"
      sha256 "8596cb8c740cc85f38aefe81749271a1688a0b18112688e7e7d40cc524145cab"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.11.0/kitops-linux-arm64.tar.gz"
      sha256 "45ef04df395b7ba9b3eb3d3783cade54c73ec38f72c48d450452c7eab3445c72"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.11.0/kitops-linux-x86_64.tar.gz"
        sha256 "e0180d701a7328f54df96d97cc627f47f8ecebf755e32c8a3c45fcfb7708c585"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.11.0/kitops-linux-i386.tar.gz"
        sha256 "f32c4b2d33c53e1ceef990e8913fb260a935c353c77ce9debc4d5a3b72ffa2db"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.11.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
