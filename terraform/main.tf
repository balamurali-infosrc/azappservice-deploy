# 1️⃣ Resource Group
resource "azurerm_resource_group" "rg" {
  name     = var.resource_group_name
  location = var.location
}

# 2️⃣ App Service Plan
resource "azurerm_service_plan" "plan" {
  name                = var.app_service_plan_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  os_type             = "Linux"
  sku_name            = "S1"
}

# 3️⃣ App Service (Web App)
resource "azurerm_linux_web_app" "webapp" {
  name                = var.app_service_name
  resource_group_name = azurerm_resource_group.rg.name
  location            = azurerm_resource_group.rg.location
  service_plan_id     = azurerm_service_plan.plan.id

  site_config {
    application_stack {
    #   dotnet_version = "v8.0" # Or "v6.0" depending on your app
     dotnet_version = "9.0"
    }
  }

#   app_settings = {
#     # "WEBSITE_RUN_FROM_PACKAGE" = "1"
#         "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"

#   }
}

# 4️⃣ Deployment Slot
resource "azurerm_linux_web_app_slot" "staging" {
  name           = var.slot_name
  app_service_id = azurerm_linux_web_app.webapp.id

  site_config {
    application_stack {
    #   dotnet_version = "v8.0" # Or "v6.0" depending on your app
       dotnet_version = "9.0"
    }
  }

#   app_settings = {
#     # "WEBSITE_RUN_FROM_PACKAGE" = "1"
#         "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"

#   }
}


# # 5️⃣ Source Control Configuration
# resource "azurerm_app_service_source_control_slot" "sourcecontrol" {
#  slot_id        = azurerm_linux_web_app_slot.staging.id
#   repo_url      = var.repo_url
#   branch        = var.branch
#   use_mercurial = false 
# }
