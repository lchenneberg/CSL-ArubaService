class Api::V1::Account::EventsController < Api::V1::Account::BaseController
	
	def index
		@events = current_user.events.all
		respond_with @events
	end

	def show
		@event =  Wys::Event.find(params[:id])
		if @event
			if check_user_access_on(@event)
				respond_with @event
			end
		else
			render status: 204, json: {message: "no_content"}
		end
	end

	def create
		@event = Wys::Event.new(params[:event])
		@event.user = current_user
		if @event.save
			render status: :created, json: {message: "event_as_been_created"}
		else
			render status: :unprocessable_entity, json: {message: "failed_to_create_event", errors: [@event.errors.as_json]}
		end
	end

	def update
		@event = Wys::Event.find(params[:id])
		if @event.update_attributes(params[:event])
			render status: 200, json: {message: "event_as_been_updated"}
		else
			render status: :unprocessable_entity, json: {message: "failed_to_update_event", errors: [@event.errors.as_json]}
		end
	end



	def destroy
		@event = Wys::Event.find(params[:id])
		#if check_user_access_on(@event)
			if @event && @event.destroy
				render status: 200, json: {message: "event_as_been_removed"}
			else
				render status: :unprocessable_entity, json: {message: "failed_to_destroy_event"}
			end
		#end
	end

end
