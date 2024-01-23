class ApplicationMailer < ActionMailer::Base
  prepend_view_path "app/views/mailers"
  default from: "info@#{Rails.application.credentials.domain_name}"
  layout "mailer"
end
