# ------------------------------------------------------------------------------
# Data
# ------------------------------------------------------------------------------

# ------------------------------------------------------------------------------
# Resources
# ------------------------------------------------------------------------------
# Provider Configuration 

# Module Calls (Instanziierung der Bausteine)
module "NAME_VM1" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  type = "VM"
}

module "NAME_VM2" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  type = "VM"
}

module "NAME_LB" {
  source  = "app.terraform.io/team-automation/generator/random"
  version = "1.0.0"
  type = "VM"
}

module "VM1" {
  source  = "app.terraform.io/team-automation/VM/fakewebservices"
  version = "1.0.0"
  # insert required variables here
  official_name = module.NAME_VM1.official_name
  vm_type = var.vm_type
}

module "VM2" {
  source  = "app.terraform.io/team-automation/VM/fakewebservices"
  version = "1.0.0"
  # insert required variables here
  official_name = module.NAME_VM2.official_name
  vm_type = var.vm_type
}
module "LB" {
  source  = "app.terraform.io/team-automation/LB/fakewebservices"
  version = "1.0.0"
  # insert required variables here
  official_name = module.NAME_LB.official_name
  servers = tolist([module.VM1.vm_id, module.VM2.vm_id ])
}
