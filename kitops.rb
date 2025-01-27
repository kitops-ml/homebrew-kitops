class Kitops < Formula
  desc "Packaging and versioning system for AI/ML projects"
  homepage "https://KitOps.ml"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.0.1/kitops-darwin-arm64.tar.gz"
      sha256 "56f987dddd3da1d4c2482feb65e5a5fec5853ae0651ed295a022f356e2fe266a"
    end
    on_intel do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.0.1/kitops-darwin-x86_64.tar.gz"
      sha256 "08ba6188efb9beacc23c7ece79a6625c6682939d3f829be0e2cdee6dfa23981d"
    end

  end

  on_linux do
    on_arm do
      url "https://github.com/jozu-ai/kitops/releases/download/v1.0.1/kitops-linux-arm64.tar.gz"
      sha256 "cdb720288915e91d83af299308dafe43fb63e3a92649851ec4aff61b0d8d8491"
    end
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/jozu-ai/kitops/releases/download/v1.0.1/kitops-linux-x86_64.tar.gz"
        sha256 "20abfe8215950080cbb2f890b61f30d32917335aab949448d972cb51162657f2"
      else
        url "https://github.com/jozu-ai/kitops/releases/download/v1.0.1/kitops-linux-i386.tar.gz"
        sha256 "e47e7aabf496ff80a80e038d1782e4229ed16553608362e18cbfe8cf9a733f1c"
      end
    end
  end

  def install
    bin.install "kit"
  end

  test do
    expected_version = "Version: 1.0.1"
    actual_version = shell_output("#{bin}/kit version").strip
    assert_match expected_version, actual_version
  end
end
