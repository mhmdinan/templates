In order to get a certificate for a site: example.com and *.example.com

docker compose run --rm certbot certonly --dns-cloudflare --dns-cloudflare-credentials /root/cloudflare.ini --dns-cloudflare-propagation-seconds 60  -d example.com -d '*.example.com'
