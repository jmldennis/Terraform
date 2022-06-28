variable "device" {
  description = "Login information"
  type        = map
  default     = {
    username  = "username"
    password  = "password"
    host      = "https://1.1.1.1"
  }
}