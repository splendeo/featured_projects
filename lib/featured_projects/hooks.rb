module FeaturedProjects
  class Hooks < Redmine::Hook::ViewListener
    # :project
    # :form
    render_on :view_projects_form, :partial => 'hooks/projects/featured_project_fields'
  end
end
