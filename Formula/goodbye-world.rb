class GoodbyeWorld < Formula
  desc "Simple C++ Goodbye World CLI to play with Homebrew & Azure Pipelines"
  homepage "https://github.com/ladislas/goodbye-world"

  url "https://github.com/ladislas/goodbye-world/archive/2.0.0.tar.gz"
  sha256 "d90ec02e8966c97a07038bf123e709ea0985db8bb354ab3d798457ad71aee086"
  revision 3

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    sha256 "06fb29821282b62aabcb00ab2a1d0597806a60038d8f52ed7c2ae9fc51fd2651" => :mojave
    sha256 "65da43e0b1a8bb155a6553fe606051d17cd48a4595a3dd200575ea59b8ea7637" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/goodbye"
  end

  test do
    assert_equal `goodbye`, "Goodbye, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
