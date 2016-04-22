class ItemDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers

  delegate_all

  def link_to
     url.present? && item_path(object) || object.source
  end

  def thumb
    h.content_tag :a, href: self.link_to do
      h.image_tag(object.url.thumb, alt: object.description)
    end
  end

  def image
    h.content_tag :a, href: object.source do
      h.image_tag(object.url, alt: object.description)
    end
  end
end
