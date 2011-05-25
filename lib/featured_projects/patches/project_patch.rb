module FeaturedProjects

  module Patches

    module ProjectPatch
    
      def self.included(base)
        base.extend(ClassMethods)
        base.send(:include, InstanceMethods)
        
        base.class_eval do
          unloadable # Send unloadable so it will not be unloaded in development
        
          safe_attributes 'is_featured',
            :if => lambda {|project, user| user.allowed_to?(:update_featured_project_flags, nil, :global => true) }

          named_scope :featured, {:conditions => {:is_featured => true}}
        
          named_scope :not_featured, { :conditions => ["#{Project.table_name}.is_featured <> :true", :true => true] }
        end

      end
      
      module ClassMethods
      end
      
      module InstanceMethods
      end

    end
    
  end

end
