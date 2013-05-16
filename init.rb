# Redmine sample plugin
require 'redmine'
require 'dispatcher'

Dispatcher.to_prepare :featured_projects do

  require_dependency 'featured_projects/hooks'

  require_dependency 'project'
  Project.send(:include, FeaturedProjects::Patches::ProjectPatch)

  require_dependency 'welcome_controller'
  unless WelcomeController.included_modules.include? FeaturedProjects::Patches::WelcomeControllerPatch
    WelcomeController.send(:include, FeaturedProjects::Patches::WelcomeControllerPatch)
  end

end

Redmine::Plugin.register :featured_projects do
  name 'Featured Projects'
  author 'Enrique García, Francisco de Juan'
  description 'Redmine featured projects'
  version '0.0.2'
end
