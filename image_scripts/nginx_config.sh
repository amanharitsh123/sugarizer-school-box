# Nginx Config File
mv /home/pi/sugarizer /etc/nginx/sites-available/default
#DNS Configurations
echo "10.0.0.1  try.sugarizer.org" >> /etc/hosts
cat > /etc/dnsmasq.conf << EOF
domain-needed
bogus-priv

domain=try.sugarizer.org
expand-hosts
local=/try.sugarizer.org/ 
bind-interfaces
EOF
