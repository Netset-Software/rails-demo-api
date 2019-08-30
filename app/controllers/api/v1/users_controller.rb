class Api::V1::UsersController < Api::V1::ApplicationController
before_action :authenticate_api_user , except: [:sign_up,:sign_in,:sign_up_social,:reset_password]

		def sign_up
			begin
					@user=User.create!(signup_params)
					@user.create_token
					render :me
				
		 	rescue Exception => e
		 		puts "error_exception #{Time.now} #{e.message}"
				err_hash={}
				err_hash[:error]=e.message
				render :json => err_hash.to_json  , status: :bad_request 
		 	end
		end

		def sign_in
		  begin
				  	email_id = params[:user][:email]
					user = User.find_by(email: params[:user][:email])
					raise "User Not Exist" if user.nil?
				if user.valid_password?(params[:user][:password])
					user.create_token 
					user.update_attributes(:devise_type=> params.dig(:user,:devise_type),:devise_id=> params.dig(:user,:devise_id))
					@user=user
					@current_api_user=user
					render :me
				else 
					raise "Password Not valid"	
				end
		  rescue Exception => e
			  	puts e.message
				err_hash={}
				err_hash[:error]=e.message
				render :json => err_hash.to_json, status: :bad_request 
		  end  	
		end

		def me
			begin
				@user=@current_api_user
				render :me	
			rescue Exception => e
				SystemLog.create_error_logs("api_v1_users_controller_me",e.message)
				err_hash={}
				err_hash[:error]=e.message
				render :json => err_hash.to_json, status: :bad_request 
			end
		
		end

		def sign_out
			begin
				@current_api_user.update_attributes(:api_secret=>nil)
				hsh={}
				hsh[:status]="true"
				hsh[:message]="sucessfully updated"						
			rescue Exception => e
		 		puts "error_exception #{Time.now} #{e.message}"
				err_hash={}
				err_hash[:error]=e.message
				render :json => err_hash.to_json , status: :bad_request 			
			end
		end
	private
		def signup_params
			params.require(:user).permit(:devise_id,:devise_type,:email,:password,:image,:notification_toogle,:phone_number)
		end
end