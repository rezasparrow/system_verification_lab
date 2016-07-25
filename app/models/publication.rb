class Publication < ActiveRecord::Base
    validates :title , presence: true
    validates :year , presence: true
    validates :publisher_id , presence: true
    validates :page , presence: true
    validates :volume, presence: true
    validates :journal_id, presence: true

    validates :page , numericality: {only_integer: true , greater_than: 0}
    validates :volume , numericality: {only_integer: true , greater_than: 0}
    validates :year , numericality: {only_integer: true , less_than_or_equal_to: Date.today.year.to_i}

    belongs_to :publisher
    belongs_to :journal
end
