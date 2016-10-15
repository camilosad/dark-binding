module HashMethods

  def simple_hash_methods(attribute, *keys)
    keys.each do |k|
      define_method("#{attribute}_#{k}") do
        send("#{attribute}['#{k}']")
      end
    end
  end

  def days_methods(*days)
    days.each do |d|
      define_method("happens_#{d}?") do
        send("#{d}_start").present? && send("#{d}_end").present?
      end
    end
  end

end