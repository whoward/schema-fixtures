require_relative '../../automated_init'

context "Equality" do
  context "Classes" do
    context "Equal" do
      control = Controls::Schema.example
      compare = Controls::Schema.example

      fixture = Equality.build(control, compare)
      fixture.()

      passed = fixture.test_session.test_passed?('Classes are the same')

      test "Passed" do
        assert(passed)
      end
    end
  end
end
