class CreateSecurities < ActiveRecord::Migration[6.0]
  def change
    create_table :securities do |t|
      t.references :issuer, null: false, foreign_key: true
      t.references :security_type, null: false, foreign_key: true
      t.references :interest_frequency, null: false, foreign_key: true
      t.string :security_name
      t.string :isin
      t.date :issue_date
      t.date :maturity_date
      t.float :outstanding_stock
      t.float :face_value
      t.float :coupon_rate

      t.timestamps
    end
  end
end
