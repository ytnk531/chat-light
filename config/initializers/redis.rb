if Rails.env.production?
  Redis.current = Redis.new
end