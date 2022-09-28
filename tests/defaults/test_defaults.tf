terraform {
  required_providers {
    # Terraform Test Provider (mangels offizieller Sprachmittel)
    test = {
      source = "terraform.io/builtin/test"
    }
    
  }
}

provider "fakewebservices" {
  token = local.provider_token
}
module "main" {
  # das zu testende Module wird geladen
  source = "../.."
  vm_type = "webserver"
}

# ------------------------------------------------------------------------------
# Assertions / Test-Definitionen
# ------------------------------------------------------------------------------

/*
#lokale Variablen können zur Nachverarbeitung von Ergebnissen genutzt werden. 
#Wenn ausgeführte Funktionen fehlschlagen, schlägt auch der Testfall fehl.
locals {
  tmp = regex(
    "^test2.*$",
    module.main.zufallszahl.b64_url,
  )
}




*/
resource "test_assertions" "testfall1" {
  # eindeutiger Identifier für den Testfall
  component = "testfall1"

  # mit den equal und check Blöcken können die Assertions abgebildet werden

   

  check "lb_id" {
    description = "LB Id has been created"
    condition   = can(module.main.lb_id != "")
  }
}