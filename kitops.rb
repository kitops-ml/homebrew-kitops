class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.8.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.8.0/kitops-darwin-arm64.tar.gz"
      sha256 "094bd367f3d0d9171de184626e6a133712aaaaa56089917c460592a9e9b581f6"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.8.0/kitops-darwin-x86_64.tar.gz"
      sha256 "b6ffd106912f62f47e8fd814b7e571bcb80c9bde89aafc55bdc1f8938cbc7d21"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.8.0/kitops-linux-arm64.tar.gz"
      sha256 "36b08156908dca24b2e16d0ef2dd9571e0439eb22f326056ddb11a861690f21d"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.8.0/kitops-linux-x86_64.tar.gz"
        sha256 "0a55cd3012dbd637d87990e1c3924e0873cb8113e5112d24c3ad3ae2a8611240"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.8.0/kitops-linux-i386.tar.gz"
        sha256 "f724db1ddd82e0fdafcbee92e3049cf9612a0507c57a77644f8da4ded5492f81"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.8.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
