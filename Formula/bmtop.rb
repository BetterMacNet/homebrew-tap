class Bmtop < Formula
  desc "Local-first macOS terminal monitor with native Apple Silicon SoC metrics"
  homepage "https://github.com/BetterMacNet/bmtop"
  url "https://github.com/BetterMacNet/bmtop/archive/refs/tags/v0.2.0.tar.gz"
  sha256 "c303c1fc30b8b930f02f4afb01eac8aeded3fb64a1648ab6094fd5e6bd53f836"
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
