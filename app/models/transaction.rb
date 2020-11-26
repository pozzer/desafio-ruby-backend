class Transaction < ApplicationRecord
  INPUTS_KINDS = [:debit, :credit, :loan_receipt, :sale, :ted, :doc].freeze
  OUTPUTS_KINDS = [:boleto, :financing, :rental].freeze

  belongs_to :store

  accepts_nested_attributes_for :store

  validates :kind, :amount, :card_number, :document_number, :occurrence_at, presence: true

  enum kind: {
    debit: 1,
    boleto: 2,
    financing: 3,
    credit: 4,
    loan_receipt: 5,
    sale: 6,
    ted: 7,
    doc: 8,
    rental: 9
  }
  
  scope :inputs, -> { where(kind: INPUTS_KINDS) }
  scope :outputs, -> { where(kind: OUTPUTS_KINDS) }

  def self.create_by_cnab(cnab)
    create({
      kind: cnab.kind,
      amount: cnab.amount_to_f,
      occurrence_at: cnab.occurrence_at,
      document_number: cnab.cpf,
      card_number: cnab.card_number,
      store_attributes: {name: cnab.store_name, owner_name: cnab.owner_name}})
  end

  private
    def autosave_associated_records_for_store
      if store.new_record?
        self.store = Store.find_or_create_by(name: store.name, owner_name: store.owner_name) 
      end
    end
end

