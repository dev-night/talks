--[[
  Sample for Dynamic Rule Generation
  The maintenance() functions will be called every second
  It can be used for generating dynamic functions and rules
  Ref: https://dnsdist.org/guides/dynblocks.html
--]]

-- Assing DBR variable to be used in maintenance function
local dbr = dynBlockRulesGroup()
dbr:setQueryRate(30, 10, "Exceeded query rate", 60)
dbr:setRCodeRate(DNSRCode.NXDOMAIN, 30, 10, "Exceeded NXD rate", 60)
dbr:setRCodeRate(DNSRCode.SERVFAIL, 20, 10, "Exceeded ServFail rate", 60)
dbr:setQTypeRate(DNSQType.ANY, 5, 10, "Exceeded ANY rate", 60)
dbr:setResponseByteRate(10000, 10, "Exceeded resp BW rate", 60)

function maintenance()
  dbr:apply()
end


-- eBPF kernel rules
-- bpf = newBPFFilter(1024, 1024, 1024)
-- setDefaultBPFFilter(bpf)
-- dbpf = newDynBPFFilter(bpf)
-- function maintenance()
--         addBPFFilterDynBlocks(exceedQRate(20, 10), dbpf, 60)
--         dbpf:purgeExpired()
-- end
-- registerDynBPFFilter(dbpf) -- for web-interface


-- Sample servers
newServer("8.8.8.8")
newServer("8.8.4.4")

-- Listen on Docker interface too 
addLocal("172.17.0.1:53")


-- WebServer with user/pass: tb/tb
webserver("127.0.0.1:8083", "tb", "tb")
