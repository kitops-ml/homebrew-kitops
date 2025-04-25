class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.5.1"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.5.1/kitops-darwin-arm64.tar.gz"
      sha256 "c81fd64300592e02230f4cd88270ca11c9ceb800c1f4d89d355209a293d6399a"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.5.1/kitops-darwin-x86_64.tar.gz"
      sha256 "26b7fd691990435d5ff8bd0e52bcc89b490fa3b2e40319457ceeb44a6066473f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.5.1/kitops-linux-arm64.tar.gz"
      sha256 "ed46925d4ded249492338be7635204c874a59ba5c4e41902638858e4ee5315e9"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.5.1/kitops-linux-x86_64.tar.gz"
        sha256 "74dd587065da07b807230ae4a28be5d09ab2c53842a335f8bbfc9ad19131e0f0"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.5.1/kitops-linux-i386.tar.gz"
        sha256 "797ac3b0640ad22e6ac1d5ee450aa2cda77ed6d85fa71c915d76c09a080049ad"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.5.1"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
