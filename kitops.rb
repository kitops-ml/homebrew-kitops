class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.2.2/kitops-darwin-arm64.tar.gz"
      sha256 "3e7f83383ba90f98f8c01b0681f8fba1b9c736eea91bc4c3b7d14e0195cefe7a"
    end
    on_intel do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.2.2/kitops-darwin-x86_64.tar.gz"
      sha256 "f49dbe538ca79379752b0c7328a7ac8ed002ea12a199f08bfb7f83452c647b77"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.2.2/kitops-linux-arm64.tar.gz"
      sha256 "3e0fb0a7bec2e1b6b96091b3fd4ab53748ae6ebbf0f22eeb4fb7893f0f70604a"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jozu-ai/kitops/releases/download/v1.2.2/kitops-linux-x86_64.tar.gz"
        sha256 "b06bd37a61c81cd20cc987166a8631d0af9d128ef5ae9fe6ededf92845c6ce86"
      else
        url "https://github.com/jozu-ai/kitops/releases/download/v1.2.2/kitops-linux-i386.tar.gz"
        sha256 "4a566c3f7d017f59ab109a57ae316dd5107a681621b99d43b79cdf98ffe4892c"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.2.2"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
