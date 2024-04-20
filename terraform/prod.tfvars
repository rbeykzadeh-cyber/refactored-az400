resource_group_name = "prod_rg"

tags = {
  Env   = "prod"
  Owner = "refactored"
}

location = "centralus"

lock = true

lock_level = "CanNotDelete"
