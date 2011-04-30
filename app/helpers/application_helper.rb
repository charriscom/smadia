module ApplicationHelper
  
  def swf_or_image_tag (size,resource)
    if (resource.content_type == "application/x-shockwave-flash")
      return swf_tag(resource.url)
    else
      return image_tag resource.url(size.to_sym)
    end
  end
  
end
