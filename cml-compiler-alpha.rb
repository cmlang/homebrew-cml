
class CmlCompilerAlpha < Formula
  VERSION = "2017.10.29-alpha"

  desc "The CML Compiler"
  homepage "https://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "a2120c7f4f6606624c1cab5311334c189142e1d514db4a1bc7200cf4ac81eba1"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
