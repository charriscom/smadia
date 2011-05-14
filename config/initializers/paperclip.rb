Paperclip.interpolates :owner_id do |attachment, style|
  attachment.instance.owner_id
end
Paperclip.interpolates :owner_type do |attachment, style|
  if attachment.instance.owner_type.nil?
    attachment.instance.class.to_s.downcase
  else
    attachment.instance.owner_type.downcase
  end
end