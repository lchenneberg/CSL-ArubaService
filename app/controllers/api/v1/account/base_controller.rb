class Api::V1::Account::BaseController < ApplicationController
	respond_to :json

	protected
	def check_user_access_on(item)
		if item.user_id == current_user.id
			return true
		else
			render :status => 403, :json => {:error => "access_forbidden"}
		end
	end

end