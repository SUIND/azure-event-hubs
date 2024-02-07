resource "massdriver_artifact" "azure_event_hubs" {
  field                = "azure_event_hubs"
  provider_resource_id = azurerm_eventhub_namespace.main.id
  name                 = "Azure Event Hubs endpoint"
  artifact = jsonencode(
    {
      data = {
        infrastructure = {
          ari      = azurerm_eventhub_namespace.main.id
          endpoint = "sb://${azurerm_eventhub_namespace.main.name}.servicebus.windows.net/"
          connection_str  = data.azurerm_eventhub_namespace_authorization_rule.listen.primary_connection_string
        }
        security = {
          iam = {
            "owner" = {
              scope = azurerm_eventhub_namespace.main.id
              role  = "Azure Event Hubs Data Owner"
            }
            "sender" = {
              scope = azurerm_eventhub_namespace.main.id
              role  = "Azure Event Hubs Data Sender"
            }
            "receiver" = {
              scope = azurerm_eventhub_namespace.main.id
              role  = "Azure Event Hubs Data Receiver"
            }
          }
        }
      }
      specs = {
        azure = {
          region = azurerm_eventhub_namespace.main.location
        }
      }
    }
  )
}
