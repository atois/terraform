data "huaweicloud_availability_zones" "default1" {}


resource "huaweicloud_elb_loadbalancer" "basic" {
  name              = "basic"
  description       = "basic example"
  cross_vpc_backend = true

  vpc_id            = "855c08d5-05e6-43dc-b26a-8db4b4419fbb"
  ipv4_subnet_id    = "d0b02bce-eeb0-4e32-9a57-e0d8316b2b75"


  availability_zone = [
  data.huaweicloud_availability_zones.default1.names[0]
  ]

  ipv4_eip_id = "e90c7323-d57b-467f-b96b-916db9bcb08e"
}