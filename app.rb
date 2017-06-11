require "sinatra"
require_relative "config/init"

get "/posts/new" do
  op = Post::Create.present({})

  Post::Cell::New.(op, url: "/posts", layout: Gemgem::Cell::Layout).()
end

post "/posts" do
  op = Post::Create.run(params) do |op|
    redirect "/posts/#{op.model.id}"
  end

  Post::Cell::New.(op, url: "/posts", layout: Gemgem::Cell::Layout).()
end

get "/posts/:id" do
  op = Post::Update.present(params)

  Post::Cell::Show.(op.model, url: "/posts", layout: Gemgem::Cell::Layout).()
end

get "/posts/:id/edit" do
  op = Post::Update.present(params)
  Post::Cell::New.(op, url: "/posts/#{op.model.id}", layout: Gemgem::Cell::Layout).()
end

post "/posts/:id" do
  op = Post::Update.run(params) do |op|
    redirect "/posts/#{op.model.id}"
  end

  Post::Cell::Show.(op.model, layout: Gemgem::Cell::Layout).()
end
