resource "huaweicloud_cce_node_pool" "node_pool" {
  cluster_id               = "aa82c871-5f1c-11ec-bb52-0255ac101249"
  name                     = "terraform-pool-test"
  os                       = "EulerOS 2.5"
  initial_node_count       = 2
  flavor_id                = "c6.xlarge.2"
  availability_zone        = "ap-southeast-3c"
  key_pair                 = "KeyPair-146c"
  scall_enable             = true
  min_node_count           = 2
  max_node_count           = 10
  scale_down_cooldown_time = 100
  priority                 = 1
  type                     = "vm"

  root_volume {
    size       = 40
    volumetype = "SAS"
  }
  data_volumes {
    size       = 100
    volumetype = "GPSSD"
    kms_key_id = "40cc3aac-c03b-4235-812c-c267f7aaa076"
  }
}
