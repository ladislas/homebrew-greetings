class GoodbyeWorld < Formula
  desc "Simple C++ Goodbye World CLI to play with Homebrew & Azure Pipelines & Secrets"
  homepage "https://github.com/ladislas/goodbye-world"

  url "https://github.com/ladislas/goodbye-world/archive/2.0.0.tar.gz"
  sha256 "d90ec02e8966c97a07038bf123e709ea0985db8bb354ab3d798457ad71aee086"

  bottle do
    root_url "https://dl.bintray.com/ladislas/bottles-greetings"
    cellar :any_skip_relocation
    rebuild 3
    sha256 "f5af01eaa895235dcd684571a1390d133f138cbf3fbb51a2ab73fe49577d71a9" => :mojave
    sha256 "8061d775371da06ee18f49f75b73089c12a812ff94c1a9ca335066fce72e2c4c" => :high_sierra
  end

  def install
    system "make"
    bin.install "build/goodbye"
  end

  test do
    assert_equal `goodbye`, "Goodbye, #{ENV["USER"]}!\nVersion #{version}\n"
  end
end
