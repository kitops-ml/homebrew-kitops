class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.15.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://kitops.gateway.scarf.sh/v1.15.0/kitops-darwin-arm64.tar.gz"
      sha256 "c0c087e464f4559b848c8e774410c1d52c0810d71ea6c4a0b7d28bbc5baf6d64"
    end
    on_intel do
      url "https://kitops.gateway.scarf.sh/v1.15.0/kitops-darwin-x86_64.tar.gz"
      sha256 "f0ec1ae6c601ecb63082a9a95b819908218c3876d29aebc1f085cfe252c9290a"
    end
  end

  on_linux do
    on_arm do
      url "https://kitops.gateway.scarf.sh/v1.15.0/kitops-linux-arm64.tar.gz"
      sha256 "0bb113d20588660f53c865f08e4beb93b72278afddae5290832dcf1ef9b93ab5"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://kitops.gateway.scarf.sh/v1.15.0/kitops-linux-x86_64.tar.gz"
        sha256 "c95ab7cfe1a57fcb37101454ff1d5b2783781a72cbbb4016018a701c892bf26f"
      else
        url "https://kitops.gateway.scarf.sh/v1.15.0/kitops-linux-i386.tar.gz"
        sha256 "b5ca577dd79d2582f64add60d9f9929a8d7b9fbcd28f70e5ff3905d924808238"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.15.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
