# class MyValidator < ActiveModel::Validator
#   def validate(record)
#     unless record.description.starts_with? 'x'
#       record.errors[:description] << 'はxで始まる必要があります'
#     end
#   end
# end

class Task < ApplicationRecord
  # include ActiveModel::Validations
  validates :name, presence: true, length: { maximum: 30 }
  # validates_with MyValidator
  validate :validate_name_not_including_comma
  belongs_to :user
  scope :recent, -> {order(created_at: :desc)}

  private
  def validate_name_not_including_comma
    errors.add(:name, 'にカンマを含めることはできません') if name&.include?(',')
  end

end