class Api::V1::ApplicationController < ActionController::API
	before_action :set_api_format
	# skip_before_filter :verify_authenticity_token 
	before_action :authenticate_api_user
  	
  	# before_action :check_pre_requirements

	def authenticate_api_user
		begin
			if current_user.present?
				@current_api_user = current_user
			else
				raise "Please add apisecret in headers" if request.headers["HTTP_APISECRET"].blank?
				puts request.headers["HTTP_APISECRET"]
				@current_api_user=User.find_by_api_secret(request.headers["HTTP_APISECRET"])
				raise "user_not_found" if @current_api_user.nil?
				unless @current_api_user.nil?
					@current_api_user.update_attributes(:last_sync_time => SystemSetting.current_time) if @current_api_user.role == 1
				end
			end
		rescue Exception => @e
				err_hash={}
				err_hash[:error]=@e.message
				render :json => err_hash.to_json, status: :unauthorized
		end
	end

	def set_api_format
		request.format = :json
	end



end