require 'rails_helper'

require_relative '../../../app/models/items/image'

RSpec.describe Image, type: :model do
   context "shoulda" do
      it { expect(subject).to validate_presence_of(:url) }
   end

   describe "upload" do
      subject { create :image }

      context "valid" do
         it { expect(subject.url).to be_present }
      end
   end
end
