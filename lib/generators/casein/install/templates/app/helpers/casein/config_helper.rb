module Casein
  module ConfigHelper
    
    # Text string containing the name of the website or client
    # Used in text and titles throughout Casein
    def casein_config_website_name
      'Casein'
    end

    # Path to the logo used for the sign in screen and top banner - it should be a transparent PNG (around 140 x 30px)
    def casein_config_logo
      'casein/casein.png'
    end

    # The server hostname where Casein will run
    def casein_config_hostname
      if ENV['RAILS_ENV'] == 'production'
        'http://www.caseincms.com'
      else
        'http://0.0.0.0:3000'
      end
    end

    # The sender email address used for notifications
    def casein_config_email_from_address
      'donotreply@caseincms.com'
    end
  
    # The page that the user is shown when they sign in or click the logo
    # do not point this at casein/index!
    def casein_config_dashboard_url
      url_for :controller => :casein, :action => :blank
    end
  
    # A list of stylesheet files to include in the page head section
    def casein_config_stylesheet_includes
      %w[casein/casein casein/custom]
    end
  
    # A list of JavaScript files to include in the page head section
    def casein_config_javascript_includes
      %w[casein/casein casein/custom]
    end
    
  end
end