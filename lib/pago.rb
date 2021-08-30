require  'ostruct'

class Pago
    def self.make_payment(order_id:, payment_method:,payment_details:)
        case payment_method
        when :check
            Rails.logger.info "Processing check: " + payment_details.fetch(:routing).to_s
            Rails.logger.info "Processing check: " + payment_details.fetch(:account).to_s
            sleep 3
            Rails.logger.info "Check processed"
        when :credit_card
            Rails.logger.info "Processing credit card: " + payment_details.fetch(:cc_num).to_s
            Rails.logger.info "Processing credit card: " + payment_details.fetch(:expiration_month).to_s
            Rails.logger.info "Processing credit card: " + payment_details.fetch(:expiration_year).to_s
            Rails.logger.info "Processing credit card: " + payment_details.fetch(:cvv).to_s
            sleep 3
            Rails.logger.info "Credit card processed"
        when :po
            Rails.logger.info "Processing purchase order: " + payment_details.fetch(:po_num).to_s
            sleep 3
            Rails.logger.info "PO processed"
        else
            raise "Unknown payment method #{payment_method}"
        end
        sleep 1
        Rails.logger.info "Order #{order_id} processed"
        OpenStruct.new(success?: true, transaction_id: (rand * 1000).to_i)
    end
end