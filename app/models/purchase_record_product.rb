class PurchaseRecordProduct < ApplicationRecord
  belongs_to :product
  belongs_to :purchaserecord, optional: true
end
