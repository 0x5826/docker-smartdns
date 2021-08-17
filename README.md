# docker-smartdns
Source Code: https://github.com/pymumu/smartdns

SmartDNS is a local DNS server. SmartDNS accepts DNS query requests from local clients, obtains DNS query results from multiple upstream DNS servers, and returns the fastest access results to clients.  
Avoiding DNS pollution and improving network access speed, supports high-performance ad filtering.  
Unlike dnsmasq's all-servers, smartdns returns the fastest access resolution. （[read more](#faq)）

### Supported tags and respective Dockerfile links
- `lastest` , `Release34` [Dockerfile](https://github.com/0x5826/docker-smartdns/blob/main/Dockerfile)

### HOW TO USE
1. Download smartdns.conf from [default smartdns config](https://raw.githubusercontent.com/pymumu/smartdns/master/etc/smartdns/smartdns.conf).
2. Copy smartdns.conf to your `path` (/etc/smartdns).
3. Run the command 
    ```
    docker run -d --name smartdns -p 53:53 -v /etc/smartdns:/etc/smartdns:ro 0x5826/smartdns
    ```