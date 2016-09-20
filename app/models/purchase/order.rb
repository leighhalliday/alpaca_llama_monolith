module Purchase
  class Order < ApplicationRecord
    has_many :llamas

    class ShippingError < RuntimeError; end

    def weight_kg
      llamas.
        map(&:weight_kg).
        reduce(0.0, &:+)
    end

    def ship!
      success, response = schedule
      if success
        update!(status: 'shipped', shipment_id: response)
      else
        fail ShippingError, response
      end
    end

    def schedule
      Shipping.schedule(
        order_id: id,
        address: {
          postal_code: postal_code
        },
        weight_kg: weight_kg,
        service_level: 'priority'
      )
    end

    def tracking_code
      Shipping.details(shipment_id).fetch(:tracking_code)
    end
  end
end
