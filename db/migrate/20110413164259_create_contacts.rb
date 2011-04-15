class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :subject
      t.string :body

      t.timestamps
    end
  end

  def self.down
    drop_table :contacts
  end
end
