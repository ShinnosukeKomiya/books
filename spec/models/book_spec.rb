require 'rails_helper'

RSpec.describe Book, type: :model do
  # Shoulda Matchers を使用
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_length_of(:title).is_at_most(10) }

end
