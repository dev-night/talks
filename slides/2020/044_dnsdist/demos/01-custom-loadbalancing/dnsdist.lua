--[[
 Example for custom load balancing using LUA
 It will forward domains starting with a number to the numbered pool
--]]

-- Custom LB-function
function splitSetup(servers, dq)
  if(string.match(dq.qname:toString(), "^%d"))
  then
    print("numbered pool")
    return leastOutstanding.policy(getPoolServers("numbered"), dq)
  else
    print("standard pool")
    return leastOutstanding.policy(servers, dq)
  end
end

-- Setting the defined function for server load-balancing
setServerPolicyLua("splitsetup", splitSetup)

-- Using built-in load-balancing methods
-- setServerPolicy(firstAvailable)

-- Define two servers for backend
newServer("8.8.8.8")
newServer({address="8.8.4.4", pool="numbered"})

-- WebServer with user/pass: tb/tb on port 8083
webserver("127.0.0.1:8083", "tb", "tb")
