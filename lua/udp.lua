s=net.createServer(net.UDP,180)
    s:listen(5000,function(c)
       c:on("receive",function(c,l)
          print(l)
       end)
    end)
