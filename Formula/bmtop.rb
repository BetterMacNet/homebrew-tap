class Bmtop < Formula
  desc "Local-first macOS terminal monitor with native Apple Silicon SoC metrics"
  homepage "https://github.com/BetterMacNet/bmtop"
  url "https://github.com/BetterMacNet/bmtop/archive/refs/tags/v0.1.0.tar.gz"
  sha256 "bce7cd21b031587cee47b6d71bf127765f33cba21e6cb54cfd8c0cbf6a7045d2"
  license "MIT"

  depends_on "rust" => :build
  depends_on :macos

  def install
    system "cargo", "install", *std_cargo_args(path: "crates/bmtop")
    generate_completions_from_executable(bin/"bmtop", "completion")
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bmtop --version")
  end
end
