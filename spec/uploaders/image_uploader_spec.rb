require 'rails_helper'

RSpec.describe ImageUploader, type: :uploader do
  context 'default values' do
    it { expect(subject.thumb.url).to be_eql('/assets/thumb_default.jpg') }
  end

  context 'validations' do
    before(:each) do
      file = File.join(Rails.root, 'spec/fixtures/images/book.jpg')
      File.open(file) { |f| subject.store!(f) }
    end

    it { expect(subject.thumb).to have_dimensions(150, 150) }
    it { expect(subject.content_type).to be_eql('image/jpeg') }
  end
end
