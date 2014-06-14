class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
			t.string :image_url
			t.string :submitted_by
			t.string :caption
      t.timestamps
    end
  end
end
