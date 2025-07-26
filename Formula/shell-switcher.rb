class ShellSwitcher < Formula
  desc "A simple shell switcher written in a shell script"
  homepage "https://github.com/Sombrechip88244/SS---Shell-Switcher"
  url "https://github.com/Sombrechip88244/SS---Shell-Switcher/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  license "GPL-3.0"

  def install
    bin.install "main.sh" => "shell-switcher"
    
    # Make the script executable
    chmod 0755, bin/"shell-switcher"
  end

  test do
    # Test that the script exists and is executable
    assert_predicate bin/"shell-switcher", :exist?
    assert_predicate bin/"shell-switcher", :executable?
    
    # Basic functionality test - check if it shows current shell
    output = shell_output("#{bin}/shell-switcher <<< 'no'")
    assert_match "Your current shell is", output
  end
end
