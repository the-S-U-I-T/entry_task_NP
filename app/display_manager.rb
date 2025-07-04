require_relative 'transaction_processor'

class DisplayManager
  include TransactionFormattable

  def initialize(transaction_processor)
    @transaction_processor = transaction_processor
  end

  def format_product_list(products)
    "Available Products:\n #{products.map { |code, details| "#{code} - #{details[:name]}: #{details[:price]}" }.join("\n") }"
  end

  def format_transaction_result(product_name, change)
    basic_result = "Dispensed #{product_name} with change #{change}"
    last_transaction = @transaction_processor.last_transaction_details

    basic_result += "\nTransaction details: #{last_transaction}" if last_transaction
    basic_result
  end
end
