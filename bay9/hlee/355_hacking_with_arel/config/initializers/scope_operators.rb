module ScopeOperators
  def or(other)
    left = arel.constraints.reduce(:and)
    right = other.arel.constraints.reduce(:and)
    scope = merge(other)
    scope.where_values = [left.or(right)]
    scope
  end
  alias_method :|, :or
end

ActiveSupport.on_load :active_record do
  ActiveRecord::Relation.send(:include, ScopeOperators)
end
