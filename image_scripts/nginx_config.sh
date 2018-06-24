# Sugarizer
cat > /etc/nginx/sites-available/default << EOF
server {
       listen 80;

       server_name _;

       add_header ‘Access-Control-Allow-Origin’ ‘*’;
       add_header ‘Access-Control-Allow-Methods’ ‘GET, POST, OPTIONS’;

       location / {
               proxy_pass http://localhost:8080;
       }
       location /contents/canope {
        root /home/pi/;
               rewrite canope.php canope.json permanent;
       }
       location /contents/khan {
        root /home/pi/;
               if ($args ~ “^lang=(..)“) {
                       set $key1 $1;
                       rewrite khan.php khan_$key1.json permanent;
               }
       }
}
EOF
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