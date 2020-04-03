class EvenntsController < ApplicationController

  def index
    @evennts = Evennt.where(createdby:current_user.id)
  end

  def show 
    @evennt = Evennt.find(params[:id]) 
  end

  def new
    @evennt = Evennt.new
  end
   
  def edit
    @evennt = Evennt.find(params[:id]) 
  end

  def create
    @evennt = Evennt.new(evennt_params.except(:email))
    
    if evennt_params[:email].include?(",")
      evennt_params[:email].split(",").each do |e|
        @evennt.users << User.find_by(email: e)
      end
    end

    @evennt.createdby = current_user.id
    if @evennt.save
      redirect_to evennt_path(@evennt)
    else
      render 'new'
    end
  end

  def update
    @evennt = Evennt.find(params[:id])
    
      if evennt_params[:email].include?(",")
        evennt_params[:email].split(",").each do |e|
          @evennt.users << User.find_by(email: e)
        end
       end

      debugger
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
