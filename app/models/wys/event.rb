class Wys::Event
  include MongoMapper::Document

  include Wys::ActsAs::Locatable
  acts_as_locatable

  key :name, String
  key :description, String
  key :from, Time
  key :to, Time
  key :url, String
  key :note, String
  key :price, Float

  timestamps!

  belongs_to :user, :class => User
  



end
