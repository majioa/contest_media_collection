class Item < ActiveRecord::Base
   belongs_to :user, inverse_of: :items

   mount_uploader :url, ImageUploader

   validates :user_id, :source, presence: true

   before_save :ensure_descripiton

   def ensure_descripiton
      if self.description.blank?
         self.description = File.basename(self.source)
      end
   end
end
