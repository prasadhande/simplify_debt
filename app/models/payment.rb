class Payment < ApplicationRecord
	STATUS = %w(pending paid)
  belongs_to :group_member
  belongs_to :owe_to_group_member, class_name: 'GroupMember'

  validates :group_member_id, :amount, :owe_to_group_member_id, presence: true
  validates :payment_status, inclusion: {in: STATUS}
end
