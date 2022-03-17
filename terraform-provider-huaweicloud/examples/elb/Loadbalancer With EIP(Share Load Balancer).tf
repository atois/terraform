resource "huaweicloud_vpc_eip" "eip_1" {
  publicip {
    type = "5_bgp"
  }
  bandwidth {
    name        = "test"
    size        = 5
    share_type  = "PER"
    charge_mode = "traffic"
  }
}
resource "huaweicloud_lb_loadbalancer" "elb_1" {
  name          = "1234"
  vip_subnet_id = huaweicloud_vpc_subnet.subnet_1.subnet_id
}
# associate eip with loadbalancer
resource "huaweicloud_networking_eip_associate" "associate_1" {
  public_ip = huaweicloud_vpc_eip.eip_1.address
  port_id   = huaweicloud_lb_loadbalancer.elb_1.vip_port_id
}

resource "huaweicloud_vpc_subnet" "subnet_1" {
  vpc_id      = "19b22549-d769-4f7a-acab-bbb18adad833"
  name        = "test"
  //ipv4_subnet_id    = "00ae0fcb-cea8-4862-ab9f-ad0a7da8b18f"
  cidr        = "172.16.0.0/24"	
  gateway_ip  = "172.16.0.1"
  //primary_dns = var.primary_dns
}