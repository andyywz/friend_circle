class CreateCircleMemberships < ActiveRecord::Migration
  def change
    create_table :circle_memberships do |t|
      t.integer :user_id
      t.integer :circle_id

      t.timestamps
    end
  end
end
