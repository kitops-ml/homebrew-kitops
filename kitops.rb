class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.2.1/kitops-darwin-arm64.tar.gz"
      sha256 "3156764042302285f932d0650831fda906e9fe49f0707c00db3ff1261f6764ae"
    end
    on_intel do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.2.1/kitops-darwin-x86_64.tar.gz"
      sha256 "d21718fc26c7f9640fc6ca5e2b00a31373d8adb4b2084ef028e895be3f97d55b"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.2.1/kitops-linux-arm64.tar.gz"
      sha256 "a9537497c0b4b06ecc658244259d6e51116b02af4f138301c68fe3407945e7f0"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jozu-ai/kitops/releases/download/v1.2.1/kitops-linux-x86_64.tar.gz"
        sha256 "dd2d0143636556dc0160a18185638549714df5bafb0275bedd1bf6be8351bfbf"
      else
        url "https://github.com/jozu-ai/kitops/releases/download/v1.2.1/kitops-linux-i386.tar.gz"
        sha256 "1297626164439fa6e001f9f0ed68e22fe2ace2d4e07d8c68b6fa3457bda0c4f7"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.2.1"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
