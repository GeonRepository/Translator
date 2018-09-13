class TranslationsController < ApplicationController
  def index
    redirect_to :root
  end
  
  def create
    output = TranslatorService.translate_text(
      translation_params[:input_text], 
      translation_params[:output_language_code]
      )
      
    Translation.create(translation_params.merge({output_text: output}))
    render json: { output: output }
  end
  
  private

  def translation_params
    params.require(:translations).permit(
      :input_language_code, 
      :input_text, 
      :output_language_code, 
      :output_text
      )
  end

end
