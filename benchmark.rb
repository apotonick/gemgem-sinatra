require "benchmark/ips"
require "sinatra"
require_relative "config/init"


op = Post::Create.present({})

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(:time => 20, :warmup => 2)

  # Typical mode, runs the block as many times as it can
  x.report("cells") { Post::Cell::New.(op, url: "/posts", layout: Gemgem::Cell::Layout).() }
end
