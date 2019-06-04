class HelloWorld < Formula
  desc "Simple C++ Hello World CLI to play with Homebrew"
  homepage "https://github.com/ladislas/hello-world"

  url "https://github.com/ladislas/hello-world/archive/8.0.0.tar.gz"
  sha256 "0caa1306c4a6c629aed2b66080375c24fc3b820fd803f9e327ae140a30da336d"
  revision 2

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    sha256 "11352ac27569e75affe45516d0fd3a086801e36f99f73c4c8f479e5e34a4712f" => :mojave
    sha256 "c37db5ca6b755603344178f73461da9179a88c01e1495000fd89f8ed58e5b264" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/hello"
  end

  test do
    assert_equal `hello`, "Hello, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
