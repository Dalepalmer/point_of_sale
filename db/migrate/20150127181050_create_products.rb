class CreateProducts < ActiveRecord::Migration
  def change
    create_table(:products) do |t|
      t.column(:name, :string)
      t.column(:price, :float)
    end
    add_column(:purchase_id, :integer)
  end
end
