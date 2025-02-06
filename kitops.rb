class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.1.0/kitops-darwin-arm64.tar.gz"
      sha256 "79229e1b42da2714b88e06bc727d624323ca80b4350bc03aa376759e625861e8"
    end
    on_intel do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.1.0/kitops-darwin-x86_64.tar.gz"
      sha256 "753349b78406290a57d152e2ec1ed9de4bbc7e61bbf9752777f7dc1037b25fd9"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.1.0/kitops-linux-arm64.tar.gz"
      sha256 "64acc41fb93997e59d74b5d1d15b5c8c65badc28b7afd7d99c96d70164e1c873"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jozu-ai/kitops/releases/download/v1.1.0/kitops-linux-x86_64.tar.gz"
        sha256 "a55af730d4f9666929bd6ebcc07404368c19b380d33363d94adf4e6c56cbaffa"
      else
        url "https://github.com/jozu-ai/kitops/releases/download/v1.1.0/kitops-linux-i386.tar.gz"
        sha256 "5cddaff580098c8178334ad50454adfe62d2cdf1b1902f923add1cbdea8052bf"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.1.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
