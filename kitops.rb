class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.9.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.9.0/kitops-darwin-arm64.tar.gz"
      sha256 "3a39cf95ac684155b65ebc66ebd5057a39372c6bee54c11d961061e6bc2d0a65"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.9.0/kitops-darwin-x86_64.tar.gz"
      sha256 "829d5745a6497bb4567f102492bceb0483d9423d6a956b45ba77e6cb0d0655e7"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.9.0/kitops-linux-arm64.tar.gz"
      sha256 "40881cba0a93e187d2fc5dd5b35b7afcced6659e3679f4b51285bd36cf2c68b7"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.9.0/kitops-linux-x86_64.tar.gz"
        sha256 "8a1760511cae24e8a725a46efb4ba6da86e32eb438eb8ea29a8db13c5079cee2"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.9.0/kitops-linux-i386.tar.gz"
        sha256 "ac9053940ddde290b8c4e41d65286805ef5e709008309108533923e70dcdccc8"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.9.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
