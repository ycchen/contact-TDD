class Contact < ActiveRecord::Base
	has_many :phones
	accepts_nested_attributes_for :phones

	validates :firstname, presence: true
	validates :lastname,  presence: true
	validates :email,	  presence: true, uniqueness: true

	def name
		[firstname, lastname].join(' ')
	end
end
