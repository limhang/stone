{
          "server":"138.128.198.147",
          "server_port":2333,   
          "local_port":1080,
          "password":"xiaozuo", 
          "timeout":60,
          "method":"aes-256-cfb" 
}

ssserver -c /etc/shadowsocks/config.json -d start

ssserver -d stop

ssserver -p 8382 -k hehe -m aes-256-cfb --user nobody -d start



{
        "server":"138.128.198.147",
        "timeout":60,
        "method":"aes-256-cfb",
        "port_password":
        {
                "2333":"xiaozuo",
                "3333":"hehe"
        },
        "_comment":
        {
                "2333":"xiaozuo",
                "3333":"hehe"
        }
}



   1 # Copyright (c) 2014-2017, racaljk.                                        
   2 # https://github.com/racaljk/hosts
   3 # Last updated: 2017-03-02
   4  
   5 #https://laod.cn/hosts/2017-google-hosts.html
   6  
   7 # This work is licensed under a CC BY-NC-SA 4.0 International License.
   8 # https://creativecommons.org/licenses/by-nc-sa/4.0/
   9  
  10 # Localhost (DO NOT REMOVE)
  11 127.0.0.1   localhost
  12 ::1 localhost ip6-localhost ip6-loopback
