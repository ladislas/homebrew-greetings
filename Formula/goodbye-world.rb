class GoodbyeWorld < Formula
  desc "Simple C++ Goodbye World CLI to play with Homebrew & Azure Pipelines"
  homepage "https://github.com/ladislas/goodbye-world"

  url "https://github.com/ladislas/goodbye-world/archive/2.0.0.tar.gz"
  sha256 "d90ec02e8966c97a07038bf123e709ea0985db8bb354ab3d798457ad71aee086"

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    sha256 "1b256369df1ea233a4e24fc27b53630e546b6904033fccd2a3a0e96cb200f6d3" => :mojave
    sha256 "d874e5f23af73747b761aba91a8a0a74d0ebf57be6b9dd16ab9e05064cb3066f" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/goodbye"
  end

  test do
    assert_equal `goodbye`, "Goodbye, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
