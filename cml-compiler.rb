require "formula"

class CmlCompiler < Formula
  VERSION = "0.4"

  desc "The CML Compiler"
  homepage "http://github.com/cmlang"
  url "http://github.com/cmlang/cml-package-#{VERSION}-distribution.zip"
  sha256 "e9a99bc926c6daee0e847960d34a4c9601c1ba925bd05eaa9d88b9fe5f8be692"

  def install
    libexec.install Dir["*"]
    bin.install_symlink libexec/"bin/cml"
  end

  test do
    assert_equal "Version: #{VERSION}", `cml --version`.strip
  end
end
