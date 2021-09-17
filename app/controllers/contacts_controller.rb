class ContactsController < ApplicationController
  def create
    @contact = Contact.create(email:params[:email], content:params[:content], object:params[:object])
    if @contact.save
      flash[:success] = "Votre email a bien été envoyé à la team Woovv ! 😘"
      redirect_to root_path
    else
      puts "😡 echec 😡"
      redirect_to root_path
    end
  end

  private


end
