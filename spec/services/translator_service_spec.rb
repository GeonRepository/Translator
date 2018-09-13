require "rails_helper"
require 'rubygems'
require 'test/unit'
require 'vcr'

VCR.configure do |config|
  config.cassette_library_dir = "spec/fixtures/vcr_cassettes"
  config.hook_into :webmock
  config.filter_sensitive_data('<Google-Cloud-Resource-Prefix>') { "projects/#{ENV.fetch('GOOGLE_PROJECT_ID')}" }
end

RSpec.describe TranslatorService do
    describe "translate_text" do
    it "sends a translation request and receives a translation" do
      VCR.use_cassette("translated", record: :new_episodes,  allow_playback_repeats: true) do
          output = TranslatorService.translate_text("house", "fr")
          assert_equal "maison", output
      end
    end
  end
end
