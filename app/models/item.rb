class Item < ActiveRecord::Base
   belongs_to :user, inverse_of: :items

   mount_uploader :url, ImageUploader

   validates :type, presence: true
end
