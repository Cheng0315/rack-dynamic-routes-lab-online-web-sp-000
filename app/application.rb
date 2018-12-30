class Application
  @@items = []

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

    if req.path.match("/items/")
      item_name = req.path.split("/items/").last

      if @@items.find {|item| item.name == item_name}
        resp.write @@items.find {|item| item.name == item_name}.price
      else
        resp.write "We do not have that item"
      end
    else
      resp.write 404
    end
  end
end
