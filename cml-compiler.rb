
class CmlCompiler < Formula
  VERSION = "2017.10.14-alpha"

  desc "The CML Compiler"
  homepage "https://github.com/cmlang"
  url "https://raw.githubusercontent.com/cmlang/cml-releases/master/cml-compiler/cml-compiler-#{VERSION}.zip"
  sha256 "7cf446ba326850f22e26f69bcc0b3aad4efd0a220c75596155893b931e6853f5"

  def install
    inreplace "bin/cml", "##PREFIX##", "#{prefix}/libexec"
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
