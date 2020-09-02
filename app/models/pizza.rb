class Pizza < ApplicationRecord
    belongs_to :customer
    #belongs_to :order
    has_many :add_ons, dependent: :destroy
    has_many :toppings, through: :add_ons
    validates :size, presence: true
    validates :crust, presence: true
    validates :cheese, :toppings, presence: true

    def description
    self.size + ", " + self.cheese + " " + self.crust + " pizza with: "
    end

    def self.search(search)
       if search
        my_pies = Pizza.find_by(size: search)
            if my_pies
                customer.where(pizza_id: my_pies)
            else
                Pizza.all
            end
        else
            Pizza.all
        end
    end

end
