class HelloWorld < Formula
  desc "Simple C++ Hello World CLI to play with Homebrew"
  homepage "https://github.com/ladislas/hello-world"

  url "https://github.com/ladislas/hello-world/archive/8.0.0.tar.gz"
  sha256 "0caa1306c4a6c629aed2b66080375c24fc3b820fd803f9e327ae140a30da336d"
  revision 2

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    sha256 "5a2d3656be95419886721979fa78d266a8c99f850c478db942498df0fbff4b1d" => :mojave
    sha256 "a9d48906c85bfa0c45899370a5f25ffb659ca59b47d86ed55beb981acae53d46" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/hello"
  end

  test do
    assert_equal `hello`, "Hello, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
