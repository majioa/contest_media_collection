require 'open-uri'
require 'filemagic'

class ItemStore
  attr_reader :item

  def initialize item_params, user
    @item = Item.new(item_params)
    @item.user = user
  end

  def do
    if @item.source.present?
      file = File.join(Dir.tmpdir, File.basename(@item.source))
      IO.copy_stream(open(@item.source), file)
      type = FileMagic.open(:mime) { |fm| fm.file(file) }.split(/;\s+/).first
      if /^image/ =~ type
        @item.url = File.open(file)
      end
    end

    @item.save!
  rescue => e
    if e.is_a?(ActiveRecord::RecordInvalid)
      @item.errors[:url] << e.message
    end
    raise ActiveRecord::RecordInvalid, @item
  ensure
    if file
      FileUtils.rm_f(file)
    end
  end
end
