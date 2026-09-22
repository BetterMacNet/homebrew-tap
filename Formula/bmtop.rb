class Bmtop < Formula
  desc "Local-first macOS terminal monitor with native Apple Silicon SoC metrics"
  homepage "https://github.com/BetterMacNet/bmtop"
  url "https://github.com/BetterMacNet/bmtop/archive/refs/tags/v0.2.1.tar.gz"
  sha256 "bedf5035f7aaec0601167975b5fcd908600f6398908c4647562756ae4d0da319"
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
