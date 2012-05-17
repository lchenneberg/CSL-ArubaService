module Wys::ActsAs::Locatable

	def self.included(base)
		base.send :extend, Wys::ActsAs::Locatable::ClassMethods
	end

	module ClassMethods
		def acts_as_locatable
			include Wys::ActsAs::Locatable::InstanceMethods
			key :location, String
	  	key :coordinates, Array
	  	ensure_index [[:location, '2d']]
		end
		
	end

	module InstanceMethods


		def set_location(query)
			case query
			when Array
	      coord = query
	    when String
	      geo = Geokit::Geocoders::MultiGeocoder.geocode(query)
	      if geo.lat.nil?
	        # Return a default location, the geocoder couldn't find it.
	        # How about New York City?
	        coord = [-73.98,40.77]
	      else
	        coord = geo.ll
	        address = geo.full_address 
	      end
	    end
	    self.location = address || "undefined"
	    self.coordinates = coord
		end

	  def self.nearest(query, lim = 1)
	  	case query
  		when Array
	      coord = query
	    when String
	      geo = Geokit::Geocoders::MultiGeocoder.geocode(query)
	      if geo.lat.nil?
	        # Return a default location, the geocoder couldn't find it.
	        # How about New York City?
	        coord = [-73.98,40.77]
	      else
	        coord = [geo.long, geo.lat]
	      end
	    end
	  	nearests = where(:coordinates => {'$near' => coord}).limit(lim)
	  	if lim == 1
				return nearests.first
			else
				return nearests
			end
		end
	end
end