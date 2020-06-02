
addLocal("127.0.0.1:53", {reusePort=true})
addLocal("127.0.0.1:53", {reusePort=true})
addLocal("127.0.0.1:53", {reusePort=true})
addLocal("127.0.0.1:53", {reusePort=true})
addLocal("127.0.0.1:53", {reusePort=true})
addLocal("127.0.0.1:53", {reusePort=true})



-- Sample Backend Servers (Servers can be repeated)
newServer("8.8.8.8")
newServer("8.8.8.8")
newServer("8.8.8.8")
newServer("8.8.4.4")
newServer("8.8.4.4")
newServer("8.8.4.4")


-- WebServer user/pass: tb/tb
webserver("127.0.0.1:8083", "tb", "tb")
