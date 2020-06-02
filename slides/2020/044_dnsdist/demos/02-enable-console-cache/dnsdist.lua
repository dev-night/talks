--[[
 Example how to enable console and Cache
 First enable console by:
    `dnsdist -l 127.0.0.1:5300`
 In the running console write:
    `makeKey()`
 Copy the returned key and paste it into dnsdist.conf and restart the service
 You can enter the console by: 
    `dnsdist -c`
 In order to show available commands, run:
    `help`
 For example you can show top domain queries by:
    `topQueries()`

 You can show the cache stats using:
    `getPool(""):getCache():printStats()`
 Remove a specific domain:
    `getPool(""):getCache():expungeByName(newDNSName("powerdns.com"), DNSQType.A)`
 Dump contents of the cache into a file:
    `getPool(""):getCache():dump("/tmp/CacheContents")`

 Ref: https://dnsdist.org/guides/cache.html
--]]

-- Listen on this IP and port for client connections
controlSocket('127.0.0.1:5199') 
-- Shared secret for the console
setKey("SkZiPpEMd28N53N7DXx4CEzO/p7AbrHptv9fs0jCJM4=") 

-- WebServer With user/pass: tb/tb
webserver("127.0.0.1:8083", "tb", "tb") 

-- Two Sample Servers
newServer("8.8.8.8")
newServer("1.1.1.1")

-- Enable Cache 
pc = newPacketCache(10000, {maxTTL=86400, minTTL=0, temporaryFailureTTL=60, staleTTL=60, dontAge=false})
-- Set default pool cache
getPool(""):setCache(pc)
