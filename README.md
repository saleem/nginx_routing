# Readme

## Architecture diagram

This is in ![plantuml](https://plantuml.com/).
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

To test:

1. ![Postman](https://www.getpostman.com/), or
2. ![cURL](http://macappstore.org/curl/)

## Configuration
1. Ensure all the prerequisites met and dependencies are installed. 
2. Copy the nginx.conf file to the nginx config folder (possibly `/usr/local/etc/nginx`)
3. The .htpasswd file has been generated using this command `htpasswd -cb ./.htpasswd user somepassword`. You must use this (or an equivalend command that works on your OS) to generate this file in your nginx config folder. Do **not** copy the existing file there: the ![encryption routine used by htpasswd](https://www.unix.com/man-page/redhat/1/htpasswd/) is either a modified version of MD5-encryption, or the system's `crypt()` routine. It is likely that the routine used by me to generate _this_ .htpasswd file is different from the routine on _your_ computer.
4. ![Start nginx service](https://linuxize.com/post/start-stop-restart-nginx/).
5. Start the ruby-based demux in the  `ruby demux.rb` 
6. Run a curl command _similar to_ the one in `curl_command`. You'll have to change the Authorization header.
7. Alternatively, use Postman to submit the request. See the two screenshots below on how to configure your request.
![Postman Authorization](./postman1.png)
![Postman Request Parameters](./postman2.png)
8. You should be redirected to the site identified in X-MyToken, **iff** the Authentication passes.

## References
1. ![Nginx documentation](https://nginx.org/en/docs/)
2. ![Nginx: use different backend based on HTTP header](https://sites.psu.edu/jasonheffner/2015/06/19/nginx-use-different-backend-based-on-http-header/)
3. ![Nginx Rewrite URL Rules Examples](https://www.journaldev.com/26864/nginx-rewrite-url-rules)
4. ![User Nginx as a Reverse Proxy](https://www.linode.com/docs/web-servers/nginx/use-nginx-reverse-proxy/)

