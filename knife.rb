current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "horneds"
client_key               "#{current_dir}/horneds.pem"
validation_client_name   "horneds-validator"
validation_key           "#{current_dir}/horneds-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/horneds"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/cookbooks"]
cookbook_copyright       "Kirill Klenov"
cookbook_email           "horneds@gmail.com"
cookbook_license         "MIT"
