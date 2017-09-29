
class CmlCompilerAlpha < Formula
  VERSION = "2017.09.29-alpha"

  desc "The CML Compiler"
  homepage "https://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "db4a6595ed04aea9af21703a00de68b0c92fcc4ced534c4a3b71bafcc1d68dd4"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
