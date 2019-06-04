class HelloWorld < Formula
  desc "Simple C++ Hello World CLI to play with Homebrew"
  homepage "https://github.com/ladislas/hello-world"

  url "https://github.com/ladislas/hello-world/archive/7.0.0.tar.gz"
  sha256 "c1bc5eb9621fd629cc6972dafe08cc9f345cd4f8755108ed5389b77024222078"

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    sha256 "967877e62cfd2a43c1347860a0446ad0301e7aae03271bef557580a234066c3c" => :mojave
    sha256 "69eb7b7635efba31106500d38dc50c356c1e1499acabd96b92b1915118b898fa" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/hello"
  end

  test do
    assert_equal `hello`, "Hello, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
