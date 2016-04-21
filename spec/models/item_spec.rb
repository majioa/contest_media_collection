require 'rails_helper'

RSpec.describe Item, type: :model do
   context "shoulda" do
      it { expect(subject).to have_db_column(:type).of_type(:string) }
      it { expect(subject).to validate_presence_of(:type) }

      it { expect(subject).to have_db_column(:url).of_type(:string) }
      it { expect(subject).to have_db_column(:source).of_type(:string) }
      it { expect(subject).to have_db_column(:description).of_type(:text) }

      it { expect(subject).to have_db_column(:user_id).of_type(:integer) }
      it { expect(subject).to belong_to(:user) }
   end
end
