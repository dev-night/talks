--[[
  This sample file includes sample packet policies
  Including simple and combined rules  
--]]


-- Measuring traffic per IPv4 address and per /48 of IPv6
-- if traffic for such an address (range) exceeds 5 qps, it gets delayed by 100ms
-- DelayAction() only works for UDP
addAction(MaxQPSIPRule(5, 32, 48), DelayAction(100))


-- Removing RD-bit from queries exceeding 5 QPS
addAction(MaxQPSIPRule(5), NoRecurseAction())


-- Force TCP with more than 5 QPS
addAction(MaxQPSIPRule(5), TCAction())


-- Drop queries with 5 or more consecutive digits
addAction(RegexRule("[0-9]{5,}"), DropAction()) 


-- Lua Action Rules
function luarule(dq)
  if(dq.qtype==DNSQType.ANY) -- ANY
  then
    return DNSAction.Pool, "abuse" -- send to abuse pool
  else
    return DNSAction.None, ""      -- no action
  end
end
addAction(AllRule(), LuaAction(luarule))


-- Combined Rules (Refusing AXFR,IXFR except a specific IP)
addAction(AndRule(
                 {
                   OrRule(
                         {QTypeRule(DNSQType.AXFR), 
                          QTypeRule(DNSQType.IXFR)}
                        ), 
                   NotRule(
                         makeRule("192.168.1.0/24")
                        )
                 }
                 ), 
          RCodeAction(DNSRCode.REFUSED)
          )

-- Sample Backend Servers
newServer("1.1.1.1")
newServer("8.8.8.8")
newServer({address="127.0.0.53", pool="abuse"})


-- WebServer with user/pass: tb/tb
webserver("127.0.0.1:8083", "tb", "tb")

