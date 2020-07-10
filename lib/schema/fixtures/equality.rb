module Schema
  module Fixtures
    class Equality
      include TestBench::Fixture
      include Initializer

      initializer :control, :compare

      def call()
        control_class = control.class
        compare_class = compare.class

        control_class_name = control_class.name.split('::').last
        compare_class_name = compare_class.name.split('::').last

        attribute_names = control_class.attribute_names


##
        attribute_names = attribute_names.map do |attribute_name|
          { attribute_name => attribute_name }
        end
##


        # context "Attribute Equality: #{control_class_name} -> #{compare_class_name}" do
        # context "Attribute Equality: #{control_class_name}, #{compare_class_name}" do
        context "Schema Equality: #{control_class_name}, #{compare_class_name}" do

          verbose "Control Class: #{control_class.name}"
          verbose "Compare Class: #{compare_class.name}"

          attribute_names.each do |attribute_name|

            if attribute_name.is_a? Hash
              control_attribute, compare_attribute = attribute_name.keys.first, attribute_name.values.first
            else
              control_attribute, compare_attribute = attribute_name, attribute_name
            end

            control_attribute_value = control.public_send(control_attribute)
            compare_attribute_value = compare.public_send(compare_attribute)

            # display_attribute_value = "#{control_attribute_value.inspect} -> #{compare_attribute_value.inspect}"
            display_attribute_value = "#{control_attribute_value.inspect} == #{compare_attribute_value.inspect}"

            display_attribute_name = attribute_name.to_s
            display_attribute_name.delete!(':{}')

            # display_attribute_name.gsub!('=>', ' -> ')
            display_attribute_name.gsub!('=>', ' == ')

            context "#{display_attribute_name} (#{display_attribute_value})" do
              assert(compare_attribute_value == control_attribute_value)
            end
          end
        end
      end
    end
  end
end

__END__

      module Test
        class Class
          include Initializer

          initializer(
            :control_class,
            :compare_class
          )

          def self.build(control, compare)

            instance = new(control.class)


            instance
          end

          def self.call(control, compare)
            instance = build(control, compare)
            instance.()
          end
        end

        class Attribute
        end
      end