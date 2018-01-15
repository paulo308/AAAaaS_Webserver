# AAAaaS_Webserver
Nginx Server 

# Master Branch 

It is to be used when manual container deployment is made. It is pre-configured to be used with a custom Docker Network described in the documentation.

# envParams Branch 

It is to be used with marathon. The JSON file inserted in marathon to launch the container must contain main server Address, Proxy Port, External Port, as well as path for .key and .crt files of the SSL certificate for HTTPS communications. Must run as well the run script (run.sh) present in /tmp directory.

Example: 

"cmd": "./tmp/run.sh",

"parameters": [
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
        }
