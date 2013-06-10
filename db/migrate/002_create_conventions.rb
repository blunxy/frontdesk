class CreateConventions < ActiveRecord::Migration
  def change
    create_table :conventions do |t|

      t.timestamps
    end
  end
end
