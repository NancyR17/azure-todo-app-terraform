rgs = {
  naina-rg1 = {
    location = "East US 2"
  }
}

vnets_subnets = {
  vnet-naina = {
    location            = "East US 2"
    resource_group_name = "naina-rg1"
    address_space       = ["192.168.0.0/16"]
    The AzureBastionSubnet Block is required in subnets if enable_bastion=true 
    AzureBastionSubnet = {
        address_prefix = "192.168.64.0/22"
   }
    enable_bastion = true
    subnets = {
      frontend-subnet-naina = {
        address_prefix = "192.168.16.0/22"
      }
      backend-subnet-1-naina = {
        address_prefix = "192.168.32.0/22"
      }
      backend-subnet-2-naina = {
        address_prefix = "192.168.48.0/22"
      }
      AzureBastionSubnet = {
      address_prefix = "192.168.64.0/22"
      }
    }
  }
}

vms = {
  "frontend-vm-1-naina" = {
    resource_group_name = "naina-rg1"
    location            = "East US 2"
    vnet_name           = "vnet-naina"
    subnet_name         = "frontend-subnet-naina"
    size                = "Standard_DS1_v2"
    admin_username      = "devopsnaina"
    admin_password      = "Test@9876543"
    userdata_script     = "install_nginx.sh"
    inbound_open_ports  = [22, 80]
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    enable_public_ip = true
  }
"frontend-vm-2-naina" = {
    resource_group_name = "naina-rg1"
    location            = "East US 2"
    vnet_name           = "vnet-naina"
    subnet_name         = "frontend-subnet-naina"
    size                = "Standard_DS1_v2"
    admin_username      = "devopsnaina"
    admin_password      = "Test@9876543"
    userdata_script     = "install_nginx.sh"
    inbound_open_ports  = [22, 80]
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    enable_public_ip = true
  }
  "backend-vm-1-naina" = {
    resource_group_name = "naina-rg1"
    location            = "East US 2"
    vnet_name           = "vnet-naina"
    subnet_name         = "backend-subnet-naina"
    size                = "Standard_DS1_v2"
    admin_username      = "devopsnaina"
    admin_password      = "Test@9876543"
    userdata_script     = "install_python.sh"
    inbound_open_ports  = [22, 8000]
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    enable_public_ip = false
  }
}

  "backend-vm-2-naina" = {
    resource_group_name = "naina-rg1"
    location            = "East US 2"
    vnet_name           = "vnet-naina"
    subnet_name         = "backend-subnet-naina"
    size                = "Standard_DS1_v2"
    admin_username      = "devopsnaina"
    admin_password      = "Test@9876543"
    userdata_script     = "install_python.sh"
    inbound_open_ports  = [22, 8000]
    source_image_reference = {
      publisher = "Canonical"
      offer     = "0001-com-ubuntu-server-focal"
      sku       = "20_04-lts"
      version   = "latest"
    }
    enable_public_ip = false
  }
}

loadbalancers = {
  lb-naina = {
    location                       = "East US 2"
    resource_group_name            = "naina-rg1"
    frontend_ip_configuration_name = "PublicIPAddress"
    sku                            = "Standard"
  }
}

backend_pools = {
  frontend-pool = {
    port        = 80
    lb_name     = "lb-naina"
    backend_vms = ["frontend-vm-1-naina", "frontend-vm-2-naina"]
  }
}

servers_dbs = {
  "nainadbs" = {
    resource_group_name            = "naina-rg1"
    location                       = "East US 2"
    version                        = "12.0"
    administrator_login            = "devopsserver"
    administrator_login_password   = "Test@9876543"
    allow_access_to_azure_services = true
    dbs                            = ["todoappdb"]
  }
}
