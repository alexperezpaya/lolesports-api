set :show_exceptions, :after_handler

error 500 do
  {message: env['sinatra.error'].message}.to_json
end

error do
  {message: env['sinatra.error'].message}.to_json
end
