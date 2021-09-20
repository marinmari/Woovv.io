# frozen_string_literal: true

class Contact < ApplicationRecord
  after_create :send_contact_email

  def send_contact_email
    ContactMailer.contact_email(self).deliver_now
  end
end
