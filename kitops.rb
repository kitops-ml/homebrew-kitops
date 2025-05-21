class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.6.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.6.0/kitops-darwin-arm64.tar.gz"
      sha256 "97822be6e61d53d5a4062fb0c71f9df75cba438856ca1b127350ffca7aa9753e"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.6.0/kitops-darwin-x86_64.tar.gz"
      sha256 "a574bcbc9b6fbbcf7d516786b30b13b2b789af9194d5c0ff3dfca50321ef33f8"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.6.0/kitops-linux-arm64.tar.gz"
      sha256 "a1c4156cff2cb66d289eaaa7a8cd258c670f18d7d6d1f3211b1b50f15260cac6"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.6.0/kitops-linux-x86_64.tar.gz"
        sha256 "2c8d6061c61af27d57b5caa308aaff7c316ee0ee37d12a0c3279c75db9bd0a8d"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.6.0/kitops-linux-i386.tar.gz"
        sha256 "9e2f84bd38c7267fdb093041795df805124af71d9ff120b6fc7a1ec8cec2e985"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.6.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
