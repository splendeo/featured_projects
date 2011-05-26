# Sample plugin migration
# Use rake db:migrate_plugins to migrate installed plugins
class AddIsFeaturedToProjects < ActiveRecord::Migration

  def self.up
    add_column :projects, :is_featured, :boolean, :default => false, :null => false
  end

  def self.down
    remove_column :accounts, :is_featured
  end

end
