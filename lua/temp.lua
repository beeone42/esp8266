
ip = wifi.sta.getip()
print("my ip:")
print(ip)

require('ds18b20')

port = 8080

-- ESP-01 GPIO Mapping
gpio5 = 1

print("Setup ds18b20 gpio")
ds18b20.setup(gpio5)

print("Start srv on")
print(ip)
print(":")
print(port)

srv=net.createServer(net.TCP)
srv:listen(port,
     function(conn)
          conn:send("HTTP/1.1 200 OK\nContent-Type: text/html\nRefresh: 5\n\n" ..
              "<!DOCTYPE HTML>" ..
              "<html><body>" ..
              "<b>ESP8266</b></br>" ..
              "Temperature : " .. ds18b20.read() .. "<br>" ..
              "Node ChipID : " .. node.chipid() .. "<br>" ..
              "Node MAC : " .. wifi.sta.getmac() .. "<br>" ..
              "Node Heap : " .. node.heap() .. "<br>" ..
              "Timer Ticks : " .. tmr.now() .. "<br>" ..
              "</html></body>")
          conn:on("sent",function(conn) conn:close() end)
     end
)
