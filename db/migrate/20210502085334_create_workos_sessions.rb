class CreateWorkosSessions < ActiveRecord::Migration[6.1]
  def change
    create_table :workos_sessions do |t|

      t.timestamps
    end
  end
end
