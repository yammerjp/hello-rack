#coding: utf-8                                                                                                                                 

=begin
run lambda {|env|
  request = Rack::Request.new(env)

  case request.path
  when '/' 
    Rack::Response.new {|r| r.redirect("/hoge")}
  when '/hoge'
    name, sex = 'yammer', 'man'

    html = ERB.new(<<-EOF).result(binding)
      <html>
      <head><meta charset="utf-8"></head>
      <body>
      name: <%= name %>。sex<%= sex %>
      </body>
      </html>
    EOF

    Rack::Response.new(html)
  else
    Rack::Response.new("not found", 404)
  end 
}
=end

class HelloRackApp
  def call(env)
    [200, {"Content-Type" => "text/plain" }, ["Hello, Rack!"]]
  end
end

run HelloRackApp.new
