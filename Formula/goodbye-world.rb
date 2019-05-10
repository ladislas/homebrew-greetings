class GoodbyeWorld < Formula
  desc "Simple C++ Goodbye World CLI to play with Homebrew"
  homepage "https://github.com/ladislas/goodbye-world"

  url "https://github.com/ladislas/goodbye-world/archive/1.0.0.tar.gz"
  sha256 "89c8cdffe5fb26474a636b4ed019d5bd7e6484c2bc7ff22fb43a1f43e7f40dec"

  def install
    system "make"
    bin.install "build/goodbye"
  end

  test do
    assert_equal `goodbye`, "Goodbye, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
