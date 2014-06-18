module ApplicationHelper
  def image_sized(image_path, size)
    if size == "large"
      actual_size = "250x250"
    elsif size == "medium"
      acutual_size = "150x150"
    else
      actual_size = "50x50"
    end
    image_tag image_path, size: "#{actual_size}"
  end
end
