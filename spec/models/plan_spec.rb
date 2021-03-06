require 'rails_helper'

RSpec.describe Plan, type: :model do
  it { should validate_presence_of(:name)}
  it { should validate_presence_of(:description)}
  it { should validate_presence_of(:num_meses_expires)}
  it { should validate_presence_of(:price)}

end
