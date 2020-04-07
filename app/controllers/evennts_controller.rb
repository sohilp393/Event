class EvenntsController < ApplicationController

  def index
    @evennts = Evennt.where(createdby:current_user.id)
  end

  def show 
    @evennt = Evennt.find_by(id:params[:id],createdby:current_user.id) 
    if @evennt.nil?
      redirect_to evennts_path
    else
      @evennt
    end
  end

  def new
    @evennt = Evennt.new
  end
   
  def edit
    @evennt = Evennt.find(params[:id]) 
  end

  def create
    @evennt = Evennt.new(evennt_params.except(:email))    
    evennt_params[:email].split(",").each do |e|
      @evennt.users << User.find_by(email: e)
    end 
    @evennt.createdby = current_user.id
      if @evennt.valid? && !evennt_params[:email].include?(current_user.email)
        @evennt.save
        redirect_to evennt_path(@evennt)
      else
        flash[:alert] = "Logged-In User cannot invite himself"
        render 'new'
      end
  end

  def update
    @evennt = Evennt.find(params[:id])
    evennt_params[:email].split(",").each do |e|
      @evennt.users << User.find_by(email: e)
    end
    debugger
    if @evennt.valid? && !evennt_params[:email].include?(current_user.email) 
      @evennt.update(evennt_params)
      redirect_to evennt_path(@evennt)
    else
      @evennt = Evennt.new
      flash[:alert] = "Logged-In User cannot invite himself"
      render 'edit'       
    end
  end

  def destroy 
    @evennt = Evennt.find(params[:id])
    @evennt.destroy
    redirect_to evennts_path
  end

private
  def evennt_params 
    params.require(:evennt).permit(:eventname,:description,:eventtime,:duration,:email)
  end
end
