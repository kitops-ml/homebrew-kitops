class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  version "1.12.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.12.0/kitops-darwin-arm64.tar.gz"
      sha256 "746ff1900e107c9555eed772587139faa89f61fefe2327e48f40f798d6e1add9"
    end
    on_intel do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.12.0/kitops-darwin-x86_64.tar.gz"
      sha256 "fa91d666ca36a6c71fbdcbb63373861a6ff58e94556c9a24204a58afee93ba25"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/kitops-ml/kitops/releases/download/v1.12.0/kitops-linux-arm64.tar.gz"
      sha256 "d7bb282ddbcb0edb931a386bca5b168b4134b47d1cfc7669b2da34bc3084ae69"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/kitops-ml/kitops/releases/download/v1.12.0/kitops-linux-x86_64.tar.gz"
        sha256 "7da98d4219deabf980f35879b03e3985ee46307081c18b31615fbaf493b5fadf"
      else
        url "https://github.com/kitops-ml/kitops/releases/download/v1.12.0/kitops-linux-i386.tar.gz"
        sha256 "f4e3380fd2e5b638eb5e9605c97e3a37748330d785a95af839dbf8a8b877961d"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.12.0"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
