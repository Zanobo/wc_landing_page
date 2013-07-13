class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.text :use_cases
      t.string :company_name
      t.string :market_participation
      t.string :referral_mechanism
    end
  end
end
