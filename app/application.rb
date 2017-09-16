class Application

  def call(env)
    resp = Rack::Response.new
    req = Rack::Request.new(env)

      if req.path.match(/items/)
        find_item = req.path.split("/items/").last
        item = @@items.find {|i| i.name == find_item}
        if item
          resp.write item.price
        else
          resp.write "Item not found"
          resp.status = 400
        end
      else
        resp.write "Route not found\n"
        resp.status = 404
      end
    resp.finish
  end #method

end #class
