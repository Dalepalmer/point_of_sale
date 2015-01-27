class CreateProductsPurchases < ActiveRecord::Migration
  def change
    create_table(:products_purchases) do |t|
      t.column(:product_id, :int)
      t.column(:purchase_id, :int)
    end
  end
end
