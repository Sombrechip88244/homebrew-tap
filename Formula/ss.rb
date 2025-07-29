class Ss < Formula
  desc "A simple shell switcher written in a shell script"
  homepage "https://github.com/Sombrechip88244/ss"
  url "https://github.com/Sombrechip88244/ss/archive/refs/tags/v1.1.3.tar.gz"
  sha256 "d4fc8bae7b76f4148da916bdf6fbccb320521fd3affb78efd708dbb9ac788674"
  license "GPL-3.0"

  def install
    bin.install "main.sh" => "ss"
    man1.install "man/shell-switcher.1"
    # Make the script executable
    chmod 0755, bin/"ss"
  end

  test do
    # Test that the script exists and is executable
    assert_predicate bin/"ss", :exist?
    assert_predicate bin/"ss", :executable?
    
    # Basic functionality test - check if it shows current shell
    output = shell_output("#{bin}/ss <<< 'no'")
    assert_match "Your current shell is", output
  end
end
