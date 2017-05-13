require "formula"

class CmlCompiler < Formula
  VERSION = "0.11"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "90f3fe65826d24931d3bec39c07f187726e88cfd5e8191f122ce124387ef46fb"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}"
    prefix.install Dir["*"]
    bin.install_symlink "bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
