def pet_shop_name(pet_shop)
  pet_shop[:name]
end

def total_cash(pet_shop)
  pet_shop[:admin][:total_cash]
end

def add_or_remove_cash(pet_shop, amount)
  pet_shop[:admin][:total_cash] += amount
end

# a  different way to do the above but re-using code - though it doesn't make sense to in this case
def add_and_remove_code_reuse(pet_shop, difference)
  pet_shop[:admin][:total_cash] = total_cash(pet_shop) + difference
end

def pets_sold(pet_shop)
  pet_shop[:admin][:pets_sold]
end

def increase_pets_sold(pets, new_sales)
  pets[:admin][:pets_sold] += new_sales
end

def stock_count(pet_shop)
  pet_shop[:pets].length
end

def pets_by_breed(pet_shop, type)
  pets_of_type = []
  for value in pet_shop[:pets]
    if value[:breed] == type 
    pets_of_type << value
    end
  end
  return pets_of_type
end

def find_pet_by_name(pet_shop, name)
  for animal in pet_shop[:pets]
    if animal[:name] == name
      return animal
    end
  end
  return nil
end

def remove_pet_by_name(pet_shop, name)
  for animal in pet_shop[:pets]
    if animal[:name] == name
      pet_shop[:pets].delete(animal)
   end
  end
end

def add_pet_to_stock(pet_shop, new_pet)
  pet_shop[:pets] << new_pet
end

def customer_pet_count(customer)
  customer[:pets].count
end

def add_pet_to_customer(customer, new_pet)
  customer[:pets] << new_pet
end

#OPTIONAL

def customer_can_afford_pet(customer, new_pet)
  if customer[:cash] >= new_pet[:price]
    return true
  else
    return false
  end
end


#Integration tests

def sell_pet_to_customer(pet_shop, pet, customer)
  if pet != nil && customer[:cash] >= pet[:price]  
    customer[:pets] << pet
    pet_shop[:admin][:pets_sold] += 1
    pet_shop[:admin][:total_cash] += pet[:price]
  else
    return
  end
end


