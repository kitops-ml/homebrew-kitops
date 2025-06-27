class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.7.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.7.0/kitops-darwin-arm64.tar.gz"
      sha256 "5db4b42ff9299a0dd9ca50cf50f6db952dc8d4104f2d5fe8c800e3c7befe327a"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.7.0/kitops-darwin-x86_64.tar.gz"
      sha256 "51f03dcf42cf3f9196356ecf82ab34ca981e4edc2e0c13483e45cab75625b914"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.7.0/kitops-linux-arm64.tar.gz"
      sha256 "24dec23203c3735cadd1598e579bb25d456a833695ee41b10203f05de6a3d51b"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.7.0/kitops-linux-x86_64.tar.gz"
        sha256 "2d43dc391ae850bbc15e423782d05019aea3659a611e42786f8c2a7df1820b06"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.7.0/kitops-linux-i386.tar.gz"
        sha256 "764dedfb5371c0b07203daec7746125f362d98312514caf2702bc4177b9bc3a2"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.7.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
