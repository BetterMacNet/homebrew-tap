class Bmtop < Formula
  desc "Local-first macOS terminal monitor with native Apple Silicon SoC metrics"
  homepage "https://github.com/BetterMacNet/bmtop"
  url "https://github.com/BetterMacNet/bmtop/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "9163bd5368b0245dc167b6f13b605ac4ea846e518dc1014d3f57b11c8a1a28b5"
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
