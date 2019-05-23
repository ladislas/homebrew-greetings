class GoodbyeWorld < Formula
  desc "Simple C++ Goodbye World CLI to play with Homebreww"
  homepage "https://github.com/ladislas/goodbye-world"

  url "https://github.com/ladislas/goodbye-world/archive/2.0.0.tar.gz"
  sha256 "d90ec02e8966c97a07038bf123e709ea0985db8bb354ab3d798457ad71aee086"

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    sha256 "247401e5d90af2f34c8b91c99ebcb6ea9a2fbe948bc7a0bdd27ea4dad40ed3a6" => :mojave
    sha256 "c43914de278e76108dcb9465878a446194001451be70c5a5866f272a9bbaf5c0" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/goodbye"
  end

  test do
    assert_equal `goodbye`, "Goodbye, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
