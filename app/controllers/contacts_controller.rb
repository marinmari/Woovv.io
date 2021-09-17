class ContactsController < ApplicationController
  def create
    @contact = Contact.create(email:params[:email], content:params[:content], object:params[:object])
    if @contact.save
      puts "😆 success 😆"
      redirect_to root_path
    else
      puts "😡 echec 😡"
      redirect_to root_path
    end
  end
end
