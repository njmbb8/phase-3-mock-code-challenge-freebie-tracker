class Company < ActiveRecord::Base
    has_many :freebies
    has_many :devs, through: :freebies

    def give_freebie(dev, item_name, value)
        freebie = Freebie.create(
            company_id: self.id,
            dev_id: dev.id,
            item_name: item_name,
            value: value
        )
        return freebie
    end

    def self.oldest_company
        Company.order(:founding_year)
    end
end
