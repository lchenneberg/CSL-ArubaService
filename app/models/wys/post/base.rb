class Wys::Post::Base
  include MongoMapper::Document

  key :title, String
  key :literal, String
  key :state, String
  key :tags, Array

  timestamps!

end
