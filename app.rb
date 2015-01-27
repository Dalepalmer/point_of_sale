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


get("/product/:id") do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product)
end

delete("/product/:id") do
  @product = Product.find(params.fetch("id").to_i())
  @product.delete()
  redirect("/")
end

get("/product/:id/edit") do
  @product = Product.find(params.fetch("id").to_i())
  erb(:product)
  redirect("/")
end

patch("/product/:id/edit") do
  name = params.fetch("name")
  price = params.fetch("price").to_f()
  @product = Product.find(params.fetch("id").to_i())
  @product.update({:name => name, :price => price})
  @products = Product.all()
  erb(:index)
end
