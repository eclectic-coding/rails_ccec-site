Rails.application.config.generators do |g|
  g.stylesheets false
  g.helper false
  g.serializer false
  g.jbuilder false
  g.test_framework :rspec,
    fixtures: false,
    view_specs: false,
    routing_specs: false,
    controller_specs: false
end
