# == Schema Information
#
# Table name: events
#
#  id         :integer          not null, primary key
#  date       :date
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_events_on_user_id  (user_id)
#
# Foreign Keys
#
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Event, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
