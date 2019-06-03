class GoodbyeWorld < Formula
  desc "Simple C++ Goodbye World CLI to play with Homebrew & Azure Pipelines - PR test"
  homepage "https://github.com/ladislas/goodbye-world"

  url "https://github.com/ladislas/goodbye-world/archive/2.0.0.tar.gz"
  sha256 "d90ec02e8966c97a07038bf123e709ea0985db8bb354ab3d798457ad71aee086"
  revision 1

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    sha256 "40570d2394b77662e63cb04133cd4e4f132f628ce46675f64fd808ec3781b58f" => :mojave
    sha256 "9f4e8a96693cd9ca573634e9bfd5c1ce4f2d8a2a7e8de6342fedeccba4bd8fa3" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/goodbye"
  end

  test do
    assert_equal `goodbye`, "Goodbye, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
