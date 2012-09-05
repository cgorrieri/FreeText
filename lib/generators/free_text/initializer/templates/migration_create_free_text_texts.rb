class CreateFreeTextTexts < ActiveRecord::Migration
  def change
    create_table :free_text_texts do |t|
      t.string :key
      t.string :locale
      t.text :content

      t.timestamps
    end
  end
end
