# Redmine sample plugin
require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :featured_projects do

  require_dependency 'featured_projects/hooks'
  require_dependency 'project'
  require_dependency 'welcome_controller'
  # Guards against including the module multiple time (like in tests)
  # and registering multiple callbacks
  unless Project.included_modules.include? FeaturedProjects::Patches::ProjectPatch
    Project.send(:include, FeaturedProjects::Patches::ProjectPatch)
  end
  
  unless WelcomeController.included_modules.include? FeaturedProjects::Patches::WelcomeControllerPatch
    WelcomeController.send(:include, FeaturedProjects::Patches::WelcomeControllerPatch)
  end

end

Redmine::Plugin.register :featured_projects do
  name 'Featured Projects'
  author 'Enrique García'
  description 'Redmine featured projects'
  version '0.0.1'
end
