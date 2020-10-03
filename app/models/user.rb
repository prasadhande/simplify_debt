class User < ApplicationRecord
	validates :first_name, presence: true
	
  def full_name
    "#{first_name} #{last_name}"
  end

  def data_hash
    { member_id: id, member: full_name }
  end
end
