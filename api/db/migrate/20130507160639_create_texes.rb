class CreateTexes < ActiveRecord::Migration
  def change
    create_table :texes do |t|
      t.string :message

      t.timestamps
    end
  end
end
