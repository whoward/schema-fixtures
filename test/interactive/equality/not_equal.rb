require_relative '../interactive_init'

context "Equality" do
  context "Not Equal" do
    control = Controls::Schema.example
    compare = Controls::Schema.example

    compare.some_other_attribute = Controls::Attribute::Value.random

    fixture(Equality, control, compare)
  end
end
