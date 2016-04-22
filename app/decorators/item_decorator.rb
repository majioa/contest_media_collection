class ItemDecorator < Draper::Decorator
  include Rails.application.routes.url_helpers

  delegate_all

  def link_to
     url.present? && item_path(object) || object.source
  end

  def thumb opts
    h.content_tag :a, opts.merge(href: object.url, class: 'item',
      'data-in': item_path(object), 'data-out': object.source) do
      h.image_tag(object.url.thumb, alt: object.description)
    end
  end

  def image
    h.content_tag :a, href: object.source do
      h.image_tag(object.url, alt: object.description, class: 'img-responsive')
    end
  end
end
