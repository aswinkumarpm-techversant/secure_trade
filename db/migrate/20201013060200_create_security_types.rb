class CreateSecurityTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :security_types do |t|
      t.string :name
      t.references :issuer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
