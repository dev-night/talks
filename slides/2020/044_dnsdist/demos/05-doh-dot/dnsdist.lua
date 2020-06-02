--[[
  This sample config shows show to use DoT and DoH in DnsDist
  Each Section includes its own configurations
--]]


--[[
  DNS over TLS (DoT):
  First you need to generate required certificates:
    `openssl req -newkey rsa:2048 -nodes -keyout /path/to/mydomain.key -x509 -days 365 -out /path/to/mydomain.pem`
  Configure usins following configurations.

  In the end, generate SPKI and pubish it for users:
    `echo | openssl s_client -connect 127.0.0.1:853 2>/dev/null | openssl x509 -pubkey -noout | openssl pkey -pubin -outform der | openssl dgst -sha256 -binary | openssl enc -base64`
  For Client Test, you can use `stubby` client
--]]

addTLSLocal('0.0.0.0','/path/to/mydomain.pem', '/path/to/mydomain.key') -- IPv4
addTLSLocal('[::]','/path/to/mydomain.pem', '/path/to/mydomain.key') -- IPv6


--[[
  DNS over Https (DoH):
  First you need to generate required certificates:
    `openssl req -newkey rsa:2048 -nodes -keyout /path/to/mydomain.key -x509 -days 365 -out /path/to/mydomain.pem`
  Configure usins following configurations.
  
  For Client Test, you can use `dnscrypt-proxy` or `cloudflared`
  Or use CURL with base64 of the domain name: 
  `curl -k "https://127.0.0.1/dns-query?ct&dns=q80BAAABAAAAAAAAB2V4YW1wbGUDY29tAAABAAE" -D - -o -`
  It will query 'example.com'
--]]

addDOHLocal("0.0.0.0:443", "/path/to/mydomain.pem", "/path/to/mydomain.key", "/dns-query", { doTCP=true }) -- IPv4
addDOHLocal("[::]:443", "/path/to/mydomain.pem", "/path/to/mydomain.key", "/dns-query", { doTCP=true }) -- IPv6



-- Sample Backend Servers
newServer("8.8.8.8")
newServer("8.8.4.4")

-- WebServer user/pass: tb/tb
webserver("127.0.0.1:8083", "tb", "tb")

