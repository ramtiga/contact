class ContactsController < ApplicationController
  def index
    @contact = Contact.new
    session[:contact] = nil
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.valid?
      session[:contact] = @contact
      render 'confirm'
    else
      p @contact.errors
      render 'index'
    end
  end

  def confirm
    redirect_to '/contacts' if session[:contact].blank?
    @contact = Contact.new(params[:contact])
  end

  def comp
    redirect_to '/contacts' if session[:contact].blank?
    @contact = session[:contact]
    if @contact.save
      #メール送信
      ContactMailer.cont_mail(@contact).deliver
    end

  end

end
