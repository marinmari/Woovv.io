# frozen_string_literal: true

class ContactsController < ApplicationController
  def create
    @contact = Contact.create(email: params[:email], content: params[:content], object: params[:object])
    if @contact.save
      flash[:success] = "Votre email a bien été envoyé à la team Woovv ! 😘"
    end
    redirect_to root_path
  end
end
