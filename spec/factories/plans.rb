FactoryGirl.define do
  factory :plan do
    name "Mensual"
    description "El mejor plan para los negocios"
    num_meses_expires 1
    price 230.56
  end
end
