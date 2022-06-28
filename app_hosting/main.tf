terraform {
  required_providers {
    iosxe = {
      source = "CiscoDevNet/iosxe"
    }
  }
}

provider "iosxe" {
    host = var.device.host
    device_username = var.device.username
    device_password = var.device.password
    request_timeout = 30
    insecure = true
}

resource "iosxe_rest" "rest1" {
    method = "PUT"
    path = "/data/Cisco-IOS-XE-app-hosting-cfg:app-hosting-cfg-data"
    payload = jsonencode(
        {
            "Cisco-IOS-XE-app-hosting-cfg:app-hosting-cfg-data": {
              "apps": {
                "app": [
                  {
                    "application-name": "flask",
                    "application-network-resource": {
                      "virtualportgroup-application-default-gateway-1": "10.3.14.1",
                      "nameserver-0": "208.67.222.222",
                      "nameserver-1": "208.67.220.220",
                      "virtualportgroup-guest-interface-default-gateway-1": 0,
                      "appintf-vlan-mode": "appintf-trunk"
                    },
                    "appintf-vlan-rules": {
                      "appintf-vlan-rule": [
                        {
                          "vlan-id": 314,
                          "guest-interface": 0,
                          "guest-ip": "10.3.14.249",
                          "guest-ipnetmask": "255.255.255.0"
                        }
                      ]
                    }
                  }
                ]
              }
            }
          
         }
    )
}