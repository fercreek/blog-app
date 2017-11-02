class Post < ApplicationRecord
  enum status: { draft: 0, published: 1 } do 
    event :publish do
      after do
        self.published_at = DateTime.now
        self.save
      end

      transition :draft => :published
    end
  end

  attr_accessor :state_event

  after_save :trigger_state, if: :state_event
  private def trigger_state
    send(state_event) if send(:"can_#{state_event}?")
  end

  has_many :comments

  has_many :taggings
  has_many :tags, through: :taggings
end
