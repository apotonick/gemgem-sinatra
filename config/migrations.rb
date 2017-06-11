# Migrations will run automatically. The DSL like wrapper syntax is courtesy
# of sinatra-sequel
#
# For details on sequel's schema modifications, check out:
# http://sequel.rubyforge.org/rdoc/files/doc/schema_rdoc.html

migration "create the posts table" do
  database.create_table :posts do
    primary_key :id
    string      :title
    string      :content
    string      :url_slug
  end
end

migration "add owner and roles" do
  database.add_column :posts, :owner, String
  database.add_column :posts, :roles, String
end
