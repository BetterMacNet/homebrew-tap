class Bmtop < Formula
  desc "Local-first macOS terminal monitor with native Apple Silicon SoC metrics"
  homepage "https://github.com/BetterMacNet/bmtop"
  url "https://github.com/BetterMacNet/bmtop/archive/refs/tags/v0.2.2.tar.gz"
  sha256 "82e296af2bd3bc0c2ac408df4cfaee4ba5d8fe74aceeebe7aaf03cf2292dd15e"
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
