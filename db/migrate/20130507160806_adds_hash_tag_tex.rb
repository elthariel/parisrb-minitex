class AddsHashTagTex < ActiveRecord::Migration
  def change
    create_table :hash_tags_texes, id: false do |t|
      t.integer :tex_id, null: false, default: 0
      t.integer :hash_tag_id, null: false, default: 0
    end
  end
end
