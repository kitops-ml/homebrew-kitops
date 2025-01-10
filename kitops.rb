class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v0.5.0/kitops-darwin-arm64.tar.gz"
      sha256 "6b1b47008990b61e580df0a21e2832bf855b88ee728a9f334e005af9d4017b8f"
    end
    on_intel do
      url "https://github.com/jozu-ai/kitops/releases/download/v0.5.0/kitops-darwin-x86_64.tar.gz"
      sha256 "c84e82cbe37ae399de575353c6c5668b5d024d4def7c66d0133a03722a79d936"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v0.5.0/kitops-linux-arm64.tar.gz"
      sha256 "9a37c6da6fe5099c0fa554651ff45fd0e8360cb63e07b5ad0e6f3744e07fdf31"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jozu-ai/kitops/releases/download/v0.5.0/kitops-linux-x86_64.tar.gz"
        sha256 "555383cf69252cf1fe45a41ff1b5c0deb4e16cc00c30beb374601e280b8a84d8"
      else
        url "https://github.com/jozu-ai/kitops/releases/download/v0.5.0/kitops-linux-i386.tar.gz"
        sha256 "72b7eb07afd8e7ae34d88fdddea060d2f27472dc4858330a180c5a673e2f9a3f"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 0.5.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
