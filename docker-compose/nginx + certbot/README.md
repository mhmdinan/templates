This compose stack consists of two parts: Nginx and Certbot  
Nginx is the main reverse proxy service used to serve applications or sites.  
If using in a home environment where security is not needed Certbot is not needed.  
Certbot is used to provision certificates from lets encrypt that allow https to work and allow nginx to establish an ecrypted connection.  
This also removes the security warning you see when browsing unsecure sites that use http without certificates.  
You can self-sign certificates and load them on your device for personal use however since certificates are mainly recommended to use in public facing deployments for home use it is fine to use insecure sites if you are sure nobody is listening inside your internal home network.  

In order to get a certificate for a site: example.com and *.example.com, this is a wildcard certificate and can be used with any subdomain of example.com such as site1.example.com and site2.example.com. Wildcard certs make it so that we dont have to get certificates for each individual site. They are also helpful such that lets encrypt only needs to verify you own the domain and not that the domain is pointing to your server. This way you can get proper certificates without opening ports from your home network which is not recommended if you don't know what you are doing.  


Following is command run to provision certificates from let's encrypt with a cloudflare domain and DNS-01 challenge:
docker compose run --rm certbot certonly --dns-cloudflare --dns-cloudflare-credentials /root/cloudflare.ini --dns-cloudflare-propagation-seconds 60  -d example.com -d '*.example.com'


Nginx once runs keep configuration in memory. If you make any changes then you need to reload config for nginx.  
After making desired conf files in /nginx directory you can dry run your configuration to check for any errors:
docker compose exec nginx nginx -t

If there are no errors you can apply the configuration:
docker compose exec nginx nginx -s reload