class UploaderController < ApplicationController

  skip_before_action :verify_authenticity_token



  def uploadXlsx

    excel_file = params[:file]
    if excel_file
      result = ::Api::V1::Uploader::UploadByXlsx.new(excel_file).call
    end
    return render json: {message: "ok"}, status: 200
  end
end
