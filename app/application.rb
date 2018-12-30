class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match(/items/)
      #item_name = req.path.scan(/(?<=items\/)(.*)(?=\/.+)/).first


        resp.write "We do not have that item"
      end
    else
      resp.write "Route not found"
      resp.status 404
    end

    resp.finish
  end


end
