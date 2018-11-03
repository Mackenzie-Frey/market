require './lib/vendor'

class Market

  attr_reader :name, :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  # def vendors_that_sell(query_item)
  #   available_vendors = []
  #   @vendors.each do |vendor|
  #     vendor.inventory.each do |item_in_inventory|
  #       if item_in_inventory[0] == query_item
  #         available_vendors << vendor
  #       end
  #     end
  #   end
  #   available_vendors
  # end

  def vendors_that_sell(query_item)
    @vendors.find_all do |vendor|
      vendor.inventory.keys.include?(query_item)
    end
  end

  def sorted_item_list
    sorted_items = []
    @vendors.each do |vendor|
      sorted_items << vendor.inventory.keys
    end
    sorted_items.flatten.uniq.sort
  end

  def total_inventory
    inventory_total = Hash.new(0)
    @vendors. each do |vendor|
      vendor.inventory.each do |item, quantity|
        inventory_total[item] += quantity
      end
    end
    inventory_total
  end

  def sell(item_requested, quantity_requested)
    @vendors.each do |vendor|
      vendor.inventory.each do |vendor_item, vendor_quantity|
        if vendor_item == item_requested
          difference = vendor_quantity - quantity_requested

          if difference < 0
            
          end
        end
        binding.pry
      end
    end
  end

end
