class ApplicationMailer < ActionMailer::Base
  default from: "info@#{Rails.application.credentials.domain_name}"
  layout "mailer"
end
