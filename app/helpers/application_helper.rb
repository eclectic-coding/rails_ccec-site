module ApplicationHelper
  include Pagy::Frontend

  def date_timestamp(date)
    date.nil? ? '' : date.strftime('%m-%d-%Y %I:%M:%S %p')
  end

  def sort_link(column:, label:, resource:, link:)
    if column == session.dig("#{resource.downcase}_filters", 'column')
      link_to(label, send("list_#{link}_path", column: column, direction: next_direction(resource)))
    else
      link_to(label, send("list_#{link}_path", column: column, direction: 'asc'))
    end
  end

  def next_direction(resource)
    (session["#{resource.downcase}_filters"]['direction'] == 'asc') ? 'desc' : 'asc'
  end

  def sort_indicator
    tag.div(class: "sort sort-#{params[:direction]}")
  end

  def component(name, *, **, &)
    component = (name.to_s.camelize + 'Component').constantize
    render(component.new(*, **), &)
  end

  def old_component(name, *, **, &)
    component = (name.to_s.camelize + 'Component').constantize
    render(component.new(*, **), &)
  end
end
