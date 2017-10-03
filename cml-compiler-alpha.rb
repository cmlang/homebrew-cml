
class CmlCompilerAlpha < Formula
  VERSION = "2017.10.03-alpha"

  desc "The CML Compiler"
  homepage "https://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "c040a6c234f43e35a3b32ef6340dc87af5fa67e841a72e99144f8a4a768ad242"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
