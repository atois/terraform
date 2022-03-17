data "huaweicloud_availability_zones" "default1" {}
resource "huaweicloud_vpc" "default1" {
  name = "vpc-196"
  cidr = "192.168.0.0/20" 
}
resource "huaweicloud_vpc_subnet" "default1" {
  name = "1961"
  vpc_id = huaweicloud_vpc.default1.id
  cidr = "192.168.0.0/24"
  gateway_ip = "192.168.0.1"
}
resource "huaweicloud_elb_loadbalancer" "default1" {
  name              = "basic"
  cross_vpc_backend = true
  //vpc_id            = "47867676-6336-458f-b9f0-2d5f43451855"
  vpc_id            = huaweicloud_vpc.default1.id
  //ipv4_subnet_id    = "3be16ddc-11f1-44c1-881c-2967fa54c938"
  ipv4_subnet_id    = huaweicloud_vpc_subnet.default1.subnet_id
  availability_zone = [
    data.huaweicloud_availability_zones.default1.names[0]
  ]
  iptype                = "5_bgp"
  bandwidth_charge_mode = "traffic"
  sharetype             = "PER"
  bandwidth_size        = 10
}
