output "app_service_url" {
  value = azurerm_linux_web_app.webapp.default_hostname
}

output "staging_slot_url" {
  value = azurerm_linux_web_app_slot.staging.default_hostname
}
output "webapp_name" {
  value = azurerm_linux_web_app.webapp.name
}

output "slot_name" {
  value = azurerm_linux_web_app_slot.staging.name
}

output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}
