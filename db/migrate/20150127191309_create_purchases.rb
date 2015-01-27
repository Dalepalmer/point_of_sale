class CreatePurchases < ActiveRecord::Migration
  def change
    create_table(:purchases) do |t|
    t.column(:customer_name, :string)
    t.column(:total_purchase_price, :float)
    t.column(:date_of_sale, :date)
  end
 end
end
