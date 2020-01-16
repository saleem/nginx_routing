# Readme

## Architecture diagram

This is in plantuml.
```plantuml
@startuml
skinparam componentStyle uml2

node "Untrusted Group" {
  User - [Web Browser]

}
 
node "Trusted Group" {
  [Web Browser] --> HTTP
  HTTP - [nginx]
  [nginx] - [demux]
  folder "/usr/local/etc/nginx" {
    [nginx.conf]
    [.htpasswd]
  }
} 

cloud "Tunnel Agents" {
  [demux] --> [Agent One]
  [demux] --> [Agent Two]
  [demux] --> [Agent Three]
  [demux] --> [Agent Four]
}

@enduml
```

## Prerequisites and dependencies

For the Demux:

1. ![RVM](https://rvm.io/)
2. ![Ruby](https://www.ruby-lang.org/)
3. ![Bundler](https://bundler.io/)

For the Router:

1. ![nginx](https://www.nginx.com/welcome-to-nginx/)

## Configuration

## References
1. ![Nginx documentation](https://nginx.org/en/docs/)
2. ![Nginx: use different backend based on HTTP header](https://sites.psu.edu/jasonheffner/2015/06/19/nginx-use-different-backend-based-on-http-header/)
3. ![Nginx Rewrite URL Rules Examples](https://www.journaldev.com/26864/nginx-rewrite-url-rules)
4. ![User Nginx as a Reverse Proxy](https://www.linode.com/docs/web-servers/nginx/use-nginx-reverse-proxy/)
