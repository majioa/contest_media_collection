require 'rails_helper'

RSpec.describe Item, type: :model do
   context "shoulda" do
      it { expect(subject).to have_db_column(:url).of_type(:string) }

      it { expect(subject).to have_db_column(:source).of_type(:string) }
      it { expect(subject).to validate_presence_of(:source) }

      it { expect(subject).to have_db_column(:description).of_type(:text) }

      it { expect(subject).to have_db_column(:user_id).of_type(:integer) }
      it { expect(subject).to validate_presence_of(:user_id) }
      it { expect(subject).to belong_to(:user) }
   end

   describe "image upload" do
      subject { create :image }

      context "valid" do
         it { expect(subject.url).to be_present }
      end
   end
end
