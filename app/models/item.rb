class Item < ApplicationRecord
	belongs_to :item_classification, :foreign_key => "item_classification_id"
end
