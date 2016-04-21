require 'rails_helper'

require_relative '../../../app/models/items/link'

RSpec.describe Link, type: :model do
   context "shoulda" do
      it { expect(subject).to validate_presence_of(:source) }
   end
end
