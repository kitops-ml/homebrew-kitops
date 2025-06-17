class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.6.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.6.1/kitops-darwin-arm64.tar.gz"
      sha256 "3b270bc34635f9abbee60d3bd813d8aad6958dbe2b6717c541e638efff871f5d"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.6.1/kitops-darwin-x86_64.tar.gz"
      sha256 "1ff5c5e3381ba49ef38cd47be220143489ef79d440229093c62aa1cf2a212c41"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.6.1/kitops-linux-arm64.tar.gz"
      sha256 "18978f352c1ad88b568f7069013636d27a63c0a5ea04e804f0b7bb609fbe9ceb"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.6.1/kitops-linux-x86_64.tar.gz"
        sha256 "87f842188e1d859e25ff074a7d3812b5a9273ffcbfef663a9e80780e2610b083"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.6.1/kitops-linux-i386.tar.gz"
        sha256 "18fe9c01cc67c9bbb6d1ad641e4cf0871479df7389082324694a3d4163287b30"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.6.1"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
