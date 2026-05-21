class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.14.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.14.0/kitops-darwin-arm64.tar.gz"
      sha256 "2e6ef55f8928ff351ab82ad3ced6e248e2bf7ec2b2c43e3d1e27c297f4f91235"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.14.0/kitops-darwin-x86_64.tar.gz"
      sha256 "fec660d8ab737e3e36794dfb7bbcc03af200bca0835575995f959b0c0a3b5c88"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.14.0/kitops-linux-arm64.tar.gz"
      sha256 "8997dd4658c8937cd9eafc4a3d1c2d2f8454d7671dff9f4f5d494bbd701b05f1"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.14.0/kitops-linux-x86_64.tar.gz"
        sha256 "f53f4ea7a5ea9e89cbe285334eb980906ab75d1a4804160895820794c75181fd"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.14.0/kitops-linux-i386.tar.gz"
        sha256 "5765ff3612fc1051fa825ea59725870e1c6c4ff2256739e8e132f9844f859b7c"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.14.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
