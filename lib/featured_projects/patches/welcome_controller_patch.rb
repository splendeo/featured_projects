module FeaturedProjects

  module Patches

    module WelcomeControllerPatch
    
      def self.included(base)
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in development
          
          base.send(:include, InstanceMethods)
          
          base.class_eval do
            alias_method_chain :index, :featured_projects
          end
        end
      end
      
      module InstanceMethods
      
        def index_with_featured_projects
          index_without_featured_projects
          @projects = Project.visible.featured.all(:sort => 'name ASC')
        end
      
      end

    end

  end

end
