module ApplicationHelper
  include Pagy::Frontend

  def date_timestamp(date)
    date.nil? ? "" : date.strftime("%m-%d-%Y %I:%M:%S %p")
  end

  def sort_link(column:, label:, resource:, link:)
    if column == session.dig("#{resource.downcase}_filters", "column")
      link_to(label, send("list_#{link}_path", column: column, direction: next_direction(resource)))
    else
      link_to(label, send("list_#{link}_path", column: column, direction: "asc"))
    end
  end

  def next_direction(resource)
    (session["#{resource.downcase}_filters"]["direction"] == "asc") ? "desc" : "asc"
  end

  def sort_indicator
    tag.div(class: "sort sort-#{params[:direction]}")
  end

  def errors_for(model, key)
    tag.div(class: "ps-1 text-danger form-error") do
      msg = model.errors.messages_for(key).join(", ")
      "#{key.to_s.titleize} #{msg}" if msg.present?
    end
  end
end
