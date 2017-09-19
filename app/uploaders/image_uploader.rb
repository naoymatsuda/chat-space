class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick
  storage :file

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_fit: [300, 200]
  process convert: 'jpg'

  def extension_white_list
    %W[jpg jpeg gif png]
  end

  def filename
    "#{Time.zone.now.strftime('%Y%m%d%H%M%S')}.jpg" if original_filename.present?
  end

end
