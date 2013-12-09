class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :released_on, :category_id, :lock_version

  def update_with_conflict_validation(*args)
    update_attributes(*args)
  rescue ActiveRecord::StaleObjectError
    self.lock_version = lock_version_was
    errors.add :base, "This record changed while you were editing."
    changes.except("updated_at").each do |name, values|
      errors.add name, "was #{values.first}"
    end
    false
  end
end
