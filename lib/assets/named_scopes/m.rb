module M
  def self.included(base)
    base.class_eval do
      scope :your_scope, lambda {}
    end
  end
end