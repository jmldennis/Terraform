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

resource "iosxe_rest" "app-hosting" {
    method = "PUT"
    path = "/data/Cisco-IOS-XE-native:native/vlan"
    payload = jsonencode(
        {
          "Cisco-IOS-XE-native:vlan": {
            "Cisco-IOS-XE-vlan:vlan-list": [
                {
                  "id": "314",
                  "name": "pi"
                }
            ]
          }
        }
    )
}