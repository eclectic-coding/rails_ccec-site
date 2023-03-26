module AvatarHelper
  def avatar_path(object, options = {})
    size = options[:size] || 180
    default_image = "mp"
    base_url = "https://secure.gravatar.com/avatar"
    base_url_params = "?s=#{size}&d=#{default_image}"
    gravatar_id = Digest::MD5.hexdigest(object.email.downcase)
    "#{base_url}/#{gravatar_id}#{base_url_params}"
  end
end
