
class CmlCompilerAlpha < Formula
  VERSION = "2017.10.11b-alpha"

  desc "The CML Compiler"
  homepage "https://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "51760b76b19377fcb19c8d84a4cde4c514bd3225b62885eafc4140076f50a50e"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
