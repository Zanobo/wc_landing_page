class User < ActiveRecord::Base
  attr_accessible :email, :use_cases, :company_name, :market_participation, :referral_mechanism
  validates :email, :uniqueness => { :case_sensitive => false }, :presence => true, :email => true
end