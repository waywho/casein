module Casein
  class AdminUsersController < Casein::CaseinController

    unloadable
  
    before_filter :needs_admin, :except => [:show, :destroy, :update, :update_password]
    before_filter :needs_admin_or_current_user, :only => [:show, :destroy, :update, :update_password]
 
    def index
      @casein_page_title = "Users"
    	@users = Casein::AdminUser.paginate :order => "login", :page => params[:page]
    end
 
    def new
      @casein_page_title = "Add a new user"
    	@casein_admin_user = Casein::AdminUser.new
    	@casein_admin_user.time_zone = Rails.configuration.time_zone
    end
  
    def create
      @casein_admin_user = Casein::AdminUser.new casein_admin_user_params
    
      if @casein_admin_user.save
        flash[:notice] = "An email has been sent to " + @casein_admin_user.name + " with the new account details"
        redirect_to casein_admin_users_path
      else
        flash.now[:warning] = "There were problems when trying to create a new user"
        render :action => :new
      end
    end
  
    def show
    	@casein_admin_user = Casein::AdminUser.find params[:id]
    	@casein_page_title = @casein_admin_user.name + " | View User"
    end
 
    def update
      @casein_admin_user = Casein::AdminUser.find params[:id]
      @casein_page_title = @casein_admin_user.name + " | Update User"

      if @casein_admin_user.update_attributes casein_admin_user_params
        flash[:notice] = @casein_admin_user.name + " has been updated"
      else
        flash.now[:warning] = "There were problems when trying to update this user"
        render :action => :show
        return
      end
      
      if @session_user.is_admin?
        redirect_to casein_admin_users_path
      else
        redirect_to :controller => :casein, :action => :index
      end
    end
 
    def update_password
      @casein_admin_user = Casein::AdminUser.find params[:id]
      @casein_page_title = @casein_admin_user.name + " | Update Password"
       
      if @casein_admin_user.valid_password? params[:form_current_password]
        if @casein_admin_user.update_attributes casein_admin_user_params
          flash.now[:notice] = "Your password has been changed"
        else
          flash.now[:warning] = "There were problems when trying to change the password"
        end
      else
        flash.now[:warning] = "The current password is incorrect"
      end
      
      render :action => :show
    end
 
    def reset_password
      @casein_admin_user = Casein::AdminUser.find params[:id]
      @casein_page_title = @casein_admin_user.name + " | Reset Password"
       
      @casein_admin_user.notify_of_new_password = true unless @casein_admin_user.id == @session_user.id
      
      if @casein_admin_user.update_attributes casein_admin_user_params
        if @casein_admin_user.id == @session_user.id
          flash.now[:notice] = "Your password has been reset"
        else    
          flash.now[:notice] = "Password has been reset and " + @casein_admin_user.name + " has been notified by email"
        end
        
      else
        flash.now[:warning] = "There were problems when trying to reset this user's password"
      end
      render :action => :show
    end
 
    def destroy
      user = Casein::AdminUser.find params[:id]
      if user.is_admin? == false || Casein::AdminUser.has_more_than_one_admin
        user.destroy
        flash[:notice] = user.name + " has been deleted"
      end
      redirect_to casein_admin_users_path
    end

    private

      def casein_admin_user_params
        params.require(:casein_admin_user).permit(:login, :name, :email, :time_zone, :access_level, :password, :password_confirmation)
      end
 
  end
end