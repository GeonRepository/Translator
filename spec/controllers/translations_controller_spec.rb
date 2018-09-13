require "rails_helper"

RSpec.describe TranslationsController do
  describe "GET index" do
    it "redirects to the home page" do
      get :index
      expect(response).to redirect_to('/')   # wraps assert_redirected_to
    end
  end

  describe "create" do
    before do
      Translation.delete_all
    end

    it "will return a successful response when the translation completes" do
      allow(TranslatorService).to receive(:translate_text) { "a" }
      post :create, params: { translations: { input_language_code: 'en', input_text: "Hello" , output_language_code: 'de' } }
      assert_equal 200, response.status
    end

    it "makes a new translation from the input" do
      allow(TranslatorService).to receive(:translate_text) { "a" }
      assert_equal 0, Translation.count
      post :create, params: { translations: { input_language_code: 'en', input_text: "Hello" , output_language_code: 'de' } }
      assert_equal "Hello", Translation.first.try(:input_text)
    end

    it "returns the translation result" do
      result = { output: "a" }.to_json
      allow(TranslatorService).to receive(:translate_text) { "a" }
      post :create, params: { translations: { input_language_code: 'en', input_text: "Hello" , output_language_code: 'de' } }
      assert_equal result, response.body
    end

  end
end