class HelloWorld < Formula
  desc "Simple C++ Hello World CLI to play with Homebrew"
  homepage "https://github.com/ladislas/hello-world"

  url "https://github.com/ladislas/hello-world/archive/8.0.0.tar.gz"
  sha256 "0caa1306c4a6c629aed2b66080375c24fc3b820fd803f9e327ae140a30da336d"
  revision 4

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    sha256 "09bd9d79536125d7168cf3e84967f40c9f7f5a043df32ecf476f158c503518d4" => :mojave
    sha256 "3ff106162b6aae4e0286d6c8b08ba2da160f497281963bf39439e38e0c433869" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/hello"
  end

  test do
    assert_equal `hello`, "Hello, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
