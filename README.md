# AAAaaS_Webserver
AAAaaS Webserver is composed by a Nginx Server acting as Reverve Proxy. It connects to the Web Application of the AAA service and ensures secure communications by using SSL certificates. 

In this repository it is possible to find two ways of deployment using Docker containers. One way recurring to Marathon and another as standalone. Both ways demand a consequent deployment of the complementary services: web application and database).

# Master (or envParams) branch 

It is to be used with marathon. The JSON file inserted in marathon to launch the container must contain main server Address, Proxy Port, External Port, as well as path for .key and .crt files of the SSL certificate for HTTPS communications. Must run as well the run script (run.sh) present in /tmp directory.

Example: 
`"cmd": "./tmp/run.sh"`

`"parameters": [
        {
          "key": "env",
          "value": "CERT_PATH=path_to_crt_file.crt"
        },
        {
          "key": "env",
          "value": "KEY_PATH=path_to_key_file.key"
        },
        {
          "key": "env",
          "value": "PROXY_IP=10.0.0.9"
        },
        {
          "key": "env",
          "value": "PROXY_PORT=10061"
        },{
          "key": "env",
          "value": "EXTERNAL_PORT=10002"
        }`
        
        
# DockerNetwork branch

It is to be used when manual container deployment is made. It is pre-configured to be used with a custom Docker Network described in the documentation.

In this case, the user neeeds to create a Docker network such as the following example:
`docker network create --driver=bridge --subnet=172.250.0.0/24 --gateway=172.250.0.1 aaanet`

Next, it is necessary to launch the container attached to the previously created network with the tag "dockerNetwork":
`docker run --name nginx --ip=172.250.0.86 --net=aaanet -p 80:80 -p 443:443 -p 8080:8080 -ti paulo308/aaaaas_webserver:dockerNetwork`

Note that it is necessary to deploy the remaing containers of the AAA service to complete instalation. Please refer to the following repositories:
* Web Application (https://github.com/paulo308/AAAaaS_Webapp)
* Database (https://github.com/paulo308/AAAaaS_Mongodb)

