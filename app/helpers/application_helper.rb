module ApplicationHelper
  
  def swf_or_image_tag (title,size,resource)
    if (resource.content_type == "application/x-shockwave-flash")
      return swf_tag(resource.url)
    else
      unless title.nil?
        return image_tag resource.url(size.to_sym), :title => title
      else
        return image_tag resource.url(size.to_sym), :class => "image"
      end  
    end
  end
  
end
