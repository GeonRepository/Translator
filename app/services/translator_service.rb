require "google/cloud/translate"

class TranslatorService    
    def self.translate_text(text, code)
        project_id    = ENV.fetch('GOOGLE_PROJECT_ID')
        text          = text
        language_code = code
        translate   = Google::Cloud::Translate.new project: project_id
        output = translate.translate text, to: language_code, model: "nmt"
        output.text
    end
end

