# AlpacaLlama
## You buy it, we ship it!

This is a Rails app demonstrating how one might avoid microservices by defining bounded contexts within a single monolith application.

## Modules / Domains

Communication between these domains takes place as methods on the module.

### Purchase

Regarding the customer making a purchase.

- Llama
- Customer
- Order

### Shipping

Regarding the shipment and related activities (tracking, carrier, etc...)

- Shipment
- Tracking
- Carrier
