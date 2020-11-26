FactoryBot.define do
  factory :transaction do
    store
    kind { 1 }
    amount { 10.0 }
    document_number { "01619198774" }
    card_number { "5411****1111" }
    occurrence_at { DateTime.now }
  end
end
