class  Console::PhotosController <  Console::BaseController
  def create
    @photo = PhotoUploader.new(nil, 'editor')
    @photo.store! params[:upload_file]
    render json: {
        file_path: @photo.url
    }
  end

end
