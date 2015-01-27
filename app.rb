require('sinatra/activerecord')
require('sinatra')
require('sinatra/reloader')
also_reload("lib/**/*.rb")
require('./lib/product.rb')
require('./lib/purchase.rb')
require('pg')

get("/") do
  @products = Product.all()
  erb(:index)
end


post("/") do
  name = params.fetch("name")
  price = params.fetch("price").to_f()
  @product = Product.create({:name => name, :price => price})
  redirect("/")
end


get("/product_edit/:id") do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product_edit)
end

delete("/product_edit/:id") do
  @product = Product.find(params.fetch("id").to_i())
  @product.delete()
  @products = Product.all()
  erb(:index)
end
