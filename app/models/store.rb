class Store < ApplicationRecord
  has_many :transactions, dependent: :destroy

  validates :name, :owner_name, presence: true

  def outputs_sums
    @outputs_sums ||= transactions.outputs.sum(&:amount).to_f
  end

  def inputs_sums
    @inputs_sums ||= transactions.inputs.sum(&:amount).to_f
  end

  def total_sums
    inputs_sums - outputs_sums
  end
end
