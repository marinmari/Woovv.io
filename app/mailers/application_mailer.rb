# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'hello@woovv.io'
  layout 'mailer'
end
