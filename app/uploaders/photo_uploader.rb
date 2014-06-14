class PhotoUploader < CarrierWave::Uploader::Base

  def store_dir
    "#{mounted_as}"
  end

  def filename
    if super.present?
      @name ||=  SecureRandom.uuid.gsub('-', '')
      "#{Time.now.year}/#{@name}.#{file.extension.downcase}"
    end
  end

  def extension_white_list
    %w(jpg jpeg gif png webp)
  end

end