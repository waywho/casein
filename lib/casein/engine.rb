require "casein"
require "rails"

module Casein
  class Engine < Rails::Engine
    
    initializer "casein.assets.precompile" do |app|
      app.config.assets.precompile += %w(casein/login.css casein/casein.css casein/casein.js casein/html5shiv.js casein/custom.css.scss casein/custom.js casein/*.png)
    end

    rake_tasks do
      load "railties/tasks.rake"
    end
    
  end
  
  class RouteConstraint

     def matches?(request)
       return false if request.fullpath.include?("/casein")
       return false if request.fullpath.include?("/admin")
       true
     end

   end
end