resource  "huaweicloud_identity_agency" "agency"  {
  name                   = "EVSAccessKMS"
  description            = "terraform_test agency"
  delegated_service_name = "op_svc_evs"

  project_role {
    //project = "cn-north-1"
    project = "cn-north-1"

    roles   = ["KMS Administrator"]
  }
  //domain_roles = ["KMS Administrator"]
}