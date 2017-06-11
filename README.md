# Sinatra With Trailblazer

_Cause We Can._

## Stack

The following gems are used in this project.

| Gem | Layer |
|---|---|
| Sinatra | Infrastructure, Routing |
| Trailblazer | Business |
| Reform | Validation |
| Dry-validation | Validation |
| Cells | Presentation |
| Slim | Presentation |
| Formular| Form Rendering |

## Run

In development, start the server with

```ruby
rerun "bundle exec ruby app.rb"
```

And browse to `http://localhost:4567/posts/new`.