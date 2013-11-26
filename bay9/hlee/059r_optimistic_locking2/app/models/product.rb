class Product < ActiveRecord::Base
  belongs_to :category
  attr_accessible :name, :price, :released_on, :category_id, :original_updated_at
  validate :handle_conflict, only: :update

  def original_updated_at
    @original_updated_at || updated_at.to_f
  end
  attr_writer :original_updated_at

  def handle_conflict
    if @conflict || updated_at.to_f > original_updated_at.to_f
      @conflict = true
      @original_updated_at = nil
      errors.add :base, "This record changed while you were editing. Take these changes into account and submit it again."
      changes.each do |attribute, values|
        errors.add attribute, "was #{values.first}"
      end
    end
  end
end
