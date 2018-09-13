class CreateTranslations < ActiveRecord::Migration[5.2]
  def change
    create_table :translations do |t|
      t.string :input_text
      t.string :input_language_code
      t.string :output_text
      t.string :output_language_code
      t.timestamps
    end
  end
end
