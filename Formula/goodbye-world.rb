class GoodbyeWorld < Formula
  desc "Simple C++ Goodbye World CLI to play with Homebrew & Azure Pipelines"
  homepage "https://github.com/ladislas/goodbye-world"

  url "https://github.com/ladislas/goodbye-world/archive/2.0.0.tar.gz"
  sha256 "d90ec02e8966c97a07038bf123e709ea0985db8bb354ab3d798457ad71aee086"
  revision 3

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    sha256 "616a18d2e4c594a1973a398002ff0737efa3632be60dee8a2a644aaf0d1afa7a" => :mojave
    sha256 "83cfb40fb860de1bcddb000691d064f8a98b7ac101efe88d383e1c386509e01e" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/goodbye"
  end

  test do
    assert_equal `goodbye`, "Goodbye, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
