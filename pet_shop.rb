

def pet_shop_name(pet_shop)
  return pet_shop[:name]
end


def total_cash(pet_shop)
  return pet_shop[:admin][:total_cash]
end


def add_or_remove_cash(pet_shop,cash_amount)
  pet_shop[:admin][:total_cash] += cash_amount
end

def pets_sold(pet_shop)
  return pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pet_shop, newly_sold)
  pet_shop[:admin][:pets_sold] += newly_sold
end

def stock_count(pet_shop)
  return pet_shop[:pets].length()
end

def pets_by_breed(pet_shop, breed)
  breed_list = []
  for pet in pet_shop[:pets]
    if pet[:breed] == breed
      breed_list.push(pet[:breed])
    end
  end
  return breed_list
end

def find_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      return pet
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for pet in pet_shop[:pets]
    if pet[:name] == name
      pet_shop[:pets].delete(pet)
    end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets].push(new_pet)
end

def customer_pet_count(customer)
  return customer[:pets].length()
end

def add_pet_to_customer(customer, pet)
  customer[:pets].push(pet)
end

def customer_can_afford_pet(customer, new_pet)
  return customer[:cash] >= new_pet[:price]
end

def sell_pet_to_customer(pet_shop, pet, customer)
  if (pet != nil && customer_can_afford_pet(customer, pet) == true)
      add_or_remove_cash(pet_shop, pet[:price])
      add_pet_to_customer(customer, pet)
      increase_pets_sold(pet_shop, 1)
  end
end
