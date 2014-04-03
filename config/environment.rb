# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
WildMacaron::Application.initialize!


# Load the meta keywords yml file
META = YAML.load_file("#{Rails.root}/config/meta.yml")
