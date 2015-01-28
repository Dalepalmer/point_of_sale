require('spec_helper')

describe(Purchase) do
  it("tells which products are in the a purchase") do
    purchase = Purchase.create({:customer_name => "Frank Meza", :date_of_sale => "2014-05-01"})
    product1 = Product.create({:name => "Cheetos", :price => 2.99})
    product2 = Product.create({:name => "Doritos", :price => 3.99})
    purchase.products().<<(product1)
    purchase.products().<<(product2)
  expect(purchase.products()).to(eq([product1, product2]))
  end
end
