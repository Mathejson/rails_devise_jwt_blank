class Vehicle < ApplicationRecord
  def cached_name
    Rails.cache.fetch("#{cache_key_with_version}/cached_name", expires_in: 12.hours) do
      name
    end
  end
end

#adding new record
# Motorcycle.create(name: "Honda", color: "red")
# Car.create(name: "Honda", color: "red")
# Vehicle.count # => 2
# Motorcycle.count # => 1
# Car.count # => 1