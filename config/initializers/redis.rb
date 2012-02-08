uri = URI.parse(ENV["REDISTOGO_URL"])
Redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password)