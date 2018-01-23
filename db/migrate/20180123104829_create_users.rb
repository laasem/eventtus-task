class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :full_name, null: false
      t.string :profile_picture, null: false
      t.string :job_title, null: false

      t.timestamps
    end
  end
end
