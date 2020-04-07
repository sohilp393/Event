class EvenntsController < ApplicationController

  def index
    #@evennts = Evennt.where(createdby:current_user.id)
    @evennts = Evennt.evennt_createdby(current_user.id)
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
      @evennt.users << User.user_by_email(e)
    end 
    @evennt.createdby = current_user.id
      if @evennt.valid? && !evennt_params[:email].include?(current_user.email)
        @evennt.save
        redirect_to evennt_path(@evennt)
      else
        flash[:alert] = "Logged-In (#{current_user.email}) User cannot invite himself"
        render 'new'
      end
  end

  def update
    @evennt = Evennt.find(params[:id]) 
    evennt_params[:email].split(",").each do |e|
      if !e.include?(current_user.email)
        @evennt.users << User.user_by_email(e)        
      else
        flash[:alert] = "Logged-In (#{e}) User cannot invite himself"
      end
    end
    if @evennt.update(evennt_params)  
      redirect_to evennt_path(@evennt)
    else
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
